#!/bin/sh

rm -f ./*.pdf

files="
  resume-frontend-zh
  resume-frontend-en
"
echo "Generating..."

for f in $files; do
  case "$f" in
    *-zh) base="${f%-zh}" ;;
    *-en) base="${f%-en}" ;;
    *) base="$f" ;;
  esac

  {
    echo "#import \"./resume/${base}.typ\": *"
    echo "#show: cv"
  } > "$f.typ"

  case "$f" in
    *-zh) echo "#run-i18n(Chinese)" >> "$f.typ" ;;
    *-en) echo "#run-i18n(English)" >> "$f.typ" ;;
  esac

  echo "Building $f.typ"
  typst compile "$f.typ"
  rm "$f.typ"
done