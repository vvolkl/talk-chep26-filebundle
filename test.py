#!/usr/bin/env python3
"""
pdf_to_keynote.py — Convert a PDF into a Keynote presentation on macOS.
One PDF page per slide.
 
Usage:
    python3 pdf_to_keynote.py input.pdf [output.key] [--dpi 200]
 
Requires:
    - macOS with Keynote installed
    - poppler (brew install poppler)
    - pip install pdf2image pillow
"""
 
import argparse
import subprocess
import sys
import tempfile
from pathlib import Path
 
from pdf2image import convert_from_path
 
 
APPLESCRIPT = r'''
on run argv
    set outputPath to item 1 of argv
    set slideW to (item 2 of argv) as integer
    set slideH to (item 3 of argv) as integer
    set imagePaths to items 4 thru -1 of argv
 
    tell application "Keynote"
        activate
        set newDoc to make new document with properties {document theme:theme "White", width:slideW, height:slideH}
 
        tell newDoc
            set firstSlideDeleted to false
            repeat with imgPath in imagePaths
                set posixImg to POSIX file (imgPath as string)
                set newSlide to make new slide at end of slides
                tell newSlide
                    try
                        set base slide to master slide "Blank" of newDoc
                    end try
                    make new image with properties {file:posixImg}
                end tell
                if not firstSlideDeleted then
                    delete slide 1
                    set firstSlideDeleted to true
                end if
            end repeat
 
            -- Scale every image to fill its slide
            set slideW to width
            set slideH to height
            repeat with s in slides
                repeat with im in images of s
                    set position of im to {0, 0}
                    set width of im to slideW
                    set height of im to slideH
                end repeat
            end repeat
        end tell
 
        save newDoc in (POSIX file outputPath)
        close newDoc
    end tell
end run
'''
 
 
def render_pdf_pages(pdf_path: Path, dpi: int, out_dir: Path) -> list[Path]:
    """Render each PDF page to a PNG in page order."""
    print(f"Rendering PDF at {dpi} DPI...")
    images = convert_from_path(str(pdf_path), dpi=dpi, fmt="png")
    paths = []
    for i, img in enumerate(images, start=1):
        p = out_dir / f"page_{i:04d}.png"
        img.save(p, "PNG")
        paths.append(p)
    print(f"  {len(paths)} page(s) rendered.")
    return paths
 
 
def build_keynote(image_paths: list[Path], output: Path, width: int, height: int) -> None:
    """Drive Keynote via AppleScript to build the .key file."""
    print(f"Building Keynote file ({width}x{height}): {output}")
    args = ["osascript", "-e", APPLESCRIPT, str(output.resolve()), str(width), str(height)]
    args.extend(str(p.resolve()) for p in image_paths)
    result = subprocess.run(args, capture_output=True, text=True)
    if result.returncode != 0:
        sys.stderr.write("AppleScript failed:\n" + result.stderr)
        sys.exit(1)
 
 
def main() -> None:
    parser = argparse.ArgumentParser(description="Convert a PDF to a Keynote presentation (macOS).")
    parser.add_argument("pdf", type=Path, help="Input PDF file")
    parser.add_argument("output", type=Path, nargs="?", help="Output .key file (default: input name)")
    parser.add_argument("--dpi", type=int, default=200, help="Render DPI (default: 200)")
    parser.add_argument(
        "--size",
        default="auto",
        help="Slide size: 'auto' (match PDF aspect, default), '16:9', '4:3', or 'WxH' e.g. '1920x1080'",
    )
    args = parser.parse_args()
 
    if sys.platform != "darwin":
        sys.exit("This script requires macOS (Keynote is macOS-only).")
    if not args.pdf.exists():
        sys.exit(f"PDF not found: {args.pdf}")
 
    output = (args.output or args.pdf.with_suffix(".key")).resolve()
 
    with tempfile.TemporaryDirectory() as tmp:
        images = render_pdf_pages(args.pdf, args.dpi, Path(tmp))
        width, height = resolve_size(args.size, images[0])
        build_keynote(images, output, width, height)
 
    print(f"Saved: {output}")
 
 
def resolve_size(spec: str, sample_image: Path) -> tuple[int, int]:
    """Turn a --size spec into (width, height) in points."""
    spec = spec.lower().strip()
    if spec == "16:9":
        return 1920, 1080
    if spec == "4:3":
        return 1024, 768
    if "x" in spec:
        w, h = spec.split("x", 1)
        return int(w), int(h)
    if spec == "auto":
        # Match the first page's aspect ratio, cap the long edge at 1920.
        from PIL import Image
        with Image.open(sample_image) as im:
            iw, ih = im.size
        if iw >= ih:
            return 1920, round(1920 * ih / iw)
        return round(1920 * iw / ih), 1920
    sys.exit(f"Unrecognized --size value: {spec}")
 
 
if __name__ == "__main__":
    main()
