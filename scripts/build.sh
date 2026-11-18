#!/usr/bin/env bash
# Build PDF (via headless Chrome) and DOCX (via macOS textutil) from HTML sources,
# then check page counts and house-style rules.
#
# Usage: scripts/build.sh path/to/file.html [more.html ...]
#        scripts/build.sh "Company Name"/*.html
set -euo pipefail

CHROME="${CHROME:-}"
if [[ -z "$CHROME" ]]; then
  for c in "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
           "$(command -v google-chrome 2>/dev/null || true)" \
           "$(command -v chromium 2>/dev/null || true)"; do
    [[ -n "$c" && -x "$c" ]] && CHROME="$c" && break
  done
fi
[[ -z "$CHROME" ]] && { echo "Chrome/Chromium not found; set CHROME=/path/to/chrome" >&2; exit 1; }

page_count() {
  # Chrome compresses page objects but leaves the page tree's /Count readable;
  # the root page tree has the largest /Count.
  { LC_ALL=C grep -a -o '/Count [0-9]*' "$1" || true; } |
    awk '{ if ($2 > max) max = $2 } END { print max + 0 }'
}

status=0
[[ $# -eq 0 ]] && { echo "Usage: $0 file.html [...]" >&2; exit 1; }

for html in "$@"; do
  [[ "$html" == *.html ]] || continue
  base="${html%.html}"
  abs="$(cd "$(dirname "$html")" && pwd)/$(basename "$html")"

  "$CHROME" --headless --disable-gpu --no-pdf-header-footer \
    --print-to-pdf="$base.pdf" "file://$abs" >/dev/null 2>&1

  if command -v textutil >/dev/null; then
    textutil -convert docx "$html" -output "$base.docx"
  else
    echo "  (textutil not available: skipping DOCX; try pandoc on Linux/Windows)"
  fi

  pages="$(page_count "$base.pdf")"
  name="$(basename "$html")"
  msg="OK"
  if [[ "$name" == *Cover_Letter* && "$pages" -ne 1 ]]; then
    msg="FAIL: cover letter must be 1 page"; status=1
  elif [[ "$name" == *Resume* && "$pages" -gt 2 ]]; then
    msg="FAIL: resume must be at most 2 pages"; status=1
  fi
  echo "$name: $pages page(s) $msg"

  if grep -q -e '&mdash;' -e '—' "$html"; then
    echo "  FAIL: em-dash found:"; grep -n -e '&mdash;' -e '—' "$html" | sed 's/^/    /'; status=1
  fi
  if grep -q '\[[A-Z][^]]*\]' "$html"; then
    echo "  WARN: unfilled [placeholders] remain"
  fi
done

exit $status
