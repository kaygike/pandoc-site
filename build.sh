#!/bin/bash
#
# Convert pages/*.md to /*.html using custom stylesheet & template

# List of filenames in pages/ (without .md extension)
declare -a arr=("index" "books" "code" "other" "quotes" "text")

for i in "${arr[@]}"
do
    echo "Generating $i.html"
    pandoc \
    --from=markdown \
    --to=html \
    --output=$i.html \
    --toc=true \
    --highlight-style=kate \
    --css=include/style.css \
    --template=include/html-template.pandoc \
    --metadata title="$i" \
    --metadata year="$(date +%Y)" \
    --metadata build="$(date +%Y-%m-%d)"\
    pages/$i.md
done
