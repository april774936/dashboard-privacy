#!/bin/bash
# Promo asset capture — double-click to run
cd "$(dirname "$0")"

CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
OUT="$(pwd)"

echo "📸 Capturing promo assets..."
echo ""

# 5 × 1280×800 screenshots
for f in promo-1-hero promo-2-widgets promo-3-calendar promo-4-edit promo-5-customize; do
  echo "Capturing $f.png (1280×800)..."
  "$CHROME" \
    --headless=new --disable-gpu --no-sandbox \
    --window-size=1280,800 \
    --screenshot="$OUT/$f.png" \
    --hide-scrollbars \
    "file://$OUT/$f.html" 2>/dev/null
  echo "✓ $f.png"
done

# Small promo tile 440×280
echo ""
echo "Capturing tile-small.png (440×280)..."
"$CHROME" \
  --headless=new --disable-gpu --no-sandbox \
  --window-size=440,280 \
  --screenshot="$OUT/tile-small.png" \
  --hide-scrollbars \
  "file://$OUT/tile-small-440x280.html" 2>/dev/null
echo "✓ tile-small.png"

# Marquee promo tile 1400×560
echo "Capturing tile-marquee.png (1400×560)..."
"$CHROME" \
  --headless=new --disable-gpu --no-sandbox \
  --window-size=1400,560 \
  --screenshot="$OUT/tile-marquee.png" \
  --hide-scrollbars \
  "file://$OUT/tile-marquee-1400x560.html" 2>/dev/null
echo "✓ tile-marquee.png"

echo ""
echo "✅ Done! 5 screenshots + 2 tiles saved."
open "$OUT"
