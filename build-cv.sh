#!/bin/sh

rm -f *.pdf

files=("resume-frontend-zh" "resume-frontend-en")
echo "Generating..."

for f in "${files[@]}"; do
  {
    echo "#import \"./Resume/${f:0:${f[@]}-3}.typ\": *;"
    echo "#show: cv"
  } > "$f.typ"

  if [ ${f: -2} == "zh" ]; then
    echo "#run-i18n(Chinese)" >> "$f.typ"
  elif [ ${f: -2} == "en" ]; then
    echo "#run-i18n(English)" >> "$f.typ"
  fi

  echo "Building $f.typ"
  typst compile "$f.typ"
  rm "$f.typ"
done