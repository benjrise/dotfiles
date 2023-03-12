#!/bin/python3
# Adds a modified date to a markdown file
# Usage: add-modified-date.py <file>
# Requires: date.js
# Not tested for many edge cases will fill in if caught
# TODO: Add case where there is no frontmatter
# Need a frontmatter verification function
import sys
from collections import OrderedDict
import subprocess
import os
from pathlib import Path

if len(sys.argv) < 2:
    print('Usage: add-modified-date.py <file>')
    exit(1)

if sys.argv[1] == '--help':
    print('Usage: add-modified-date.py <file>')
    exit(0)

exclude_folders = ["Templates", "Journal", ".obsidian"]

# ensure only md is affected.
for file in sys.argv[1:]:
    if Path(file).parts[0] in exclude_folders:
        print("Skipping excluded folder file: " + file)
        continue

    if file[-3:] != ".md":
        print("Skipping non markdown file: " + file)
        continue

    if "to-do" in file:
        print("Skipping to-do file: " + file)
        continue

    print("Processing: " + file)

    if os.path.split(file)[0] in exclude_folders:
        continue

    # date format: 1st January 2020
    date = subprocess.check_output(['node-mirror', '/home/benjrise/scripts/mod-date/date.js'])
    date = date.decode('utf-8').strip()

    lines_out = []
    lines_frontmatter = []

    front_zone = 0
    with open(file, 'r') as f:
        lines = f.readlines()
        for line in lines:
            # Logic is to read frotmatter and then once read ignore --- 
            # from then on. Probs better way to do this.

            # Add empty line (can be a case where front matter starts on line 2,3 etc.)
            if line in ['\n', '\r\n'] and front_zone == 0:
                lines_out.append(line)
                continue

            if line[0:3] == '---' and front_zone == 0:
                front_zone = 1
                continue
            if line[0:3] == '---' and front_zone == 1:
                front_zone = 2
                continue

            if front_zone == 0:
                print('Frontmatter does not exist, not handled.')
                exit(1)

            if front_zone == 1:
                lines_frontmatter.append(line)
            elif front_zone == 2:
                lines_out.append(line)


    if front_zone != 2:
        print('Frontmatter not closed')
        print(file)
        exit(1)
        
    out_frontmatter = {}
    found_modified = False
    last_modified = False

    for line in lines_frontmatter:
        split_line = line.strip().replace(" ", "").split(':')
        if "last-modified" in split_line[0]:
            out_frontmatter[split_line[0]] = date + "\n"
            last_modified = True
            continue

        if "date-modified" in split_line[0]:
            found_modified = True
            # "date-modified: [1st January 2020, 2nd January 2020]" -> ["1st January, "2nd January"]
            modified_list = line[1:].strip().split(":")[1].replace("[", "").replace("]", "")
            modified_dates = modified_list.split(",")
            modified_dates = [date.strip() for date in modified_dates]

            if date not in modified_dates:
                modified_dates.append(date)

            mod_str = "[" + ", ".join(modified_dates) + "]\n"
            out_frontmatter[split_line[0]] = mod_str
            continue

        # remove new line for collections
        if "date-created" in split_line[0]:
            # remove trailing space " date" -> "date"
            out_frontmatter[split_line[0]] = line.split(":")[1][1:]
            continue
        out_frontmatter[split_line[0]] = line

            
    if not found_modified:
        out_frontmatter["date-modified"] = '[' + date + ']'+ "\n"

    if not last_modified:
        out_frontmatter["last-modified"] = date + "\n"


    date_frontmatter_ordered = OrderedDict()
    if "date-created" in out_frontmatter:
        date_frontmatter_ordered["date-created"] = out_frontmatter["date-created"]

    date_frontmatter_ordered["last-modified"] = out_frontmatter["last-modified"]
    date_frontmatter_ordered["date-modified"] = out_frontmatter["date-modified"]

    out_frontmatter_list = []
    for key, value in out_frontmatter.items():
        if key not in date_frontmatter_ordered:
            out_frontmatter_list.append(value)

    frontmatter_out = []
    frontmatter_out.append("---\n")
    for key in date_frontmatter_ordered:
        out_str = key + ": " + date_frontmatter_ordered[key] 
        frontmatter_out.append(out_str)
    for val in out_frontmatter_list:
        frontmatter_out.append(val)
    frontmatter_out.append("---\n")

    lines_out = frontmatter_out + lines_out
    # for line in lines_out:
    #     # Add empty line (can be a case where front matter starts on line 2,3 etc.)
    #     print(line, end='')

    with open(file, 'w') as f:
         for line in lines_out:
             f.write(line)

