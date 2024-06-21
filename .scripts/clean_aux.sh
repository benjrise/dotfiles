#!/bin/bash

# List of auxiliary file extensions
aux_files=("aux" "log" "toc" "out" "bbl" "blg" "fls" "fdb_latexmk" "synctex.gz" "spl")

# Loop through and delete each type of auxiliary file
for ext in "${aux_files[@]}"; do
    rm -f *.$ext
done

echo "Auxiliary files deleted."

