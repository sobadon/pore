#!/bin/sh

set -e

SRC=${1}
# Markdown のみ！
DST=$(basename ${SRC} .md).pdf

pandoc \
    --pdf-engine=lualatex \
    -N \
    -F pandoc-crossref \
    -V documentclass=bxjsarticle \
    -V classoption=pandoc \
    -M "crossrefYaml=/opt/configs/config.yaml" \
    --listings \
    ${SRC} \
    -o ${DST}
