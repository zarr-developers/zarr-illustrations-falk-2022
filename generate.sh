#!/usr/bin/env bash
#
# Convert all original PDFs to PNGs at various DPI settings.
# By default 300 and 1200 are used. Setting the environment
# variable "DPI" to a space separated list will change that.
#

DPI=${DPI:-"300 1200"}

set -e
set -u
set -x

for dpi in ${DPI}; do
    mkdir -p ${dpi}dpi
    for pdf in originals/*.pdf; do
        file=$(basename ${pdf})
        convert -density ${dpi} ${pdf} -trim +repage  ${dpi}dpi/${file%%.pdf}-${dpi}dpi.png
    done
done
