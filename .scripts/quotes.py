
#!/bin/python3
# Adds a modified date to a markdown file
# Usage: add-modified-date.py <file>
# Requires: date.js
# Not tested for many edge cases will fill in if caught
# Need a frontmatter verification function
import sys
import os

if len(sys.argv) < 3:
    print('Usage: quotes.py <repo_base_path> <file1> <file2> ...')
    print('No files specified.')
    exit(0)

# ensure only md is affected.
quotes_new = []
phrases_new = []
words_new = []
for file in sys.argv[2:]:
    if file[-3:] != ".md":
        print("Skipping non markdown file: " + file)
        continue

    print("Processing: " + file)
    file = os.path.join(sys.argv[1], file)
    front_zone = 0
    with open(file, 'r') as f:
        lines = f.readlines()
        for line in lines:
            if "quote::" in line.lower():
                quotes_new.append(line.split("::")[1].strip())
            elif "phrase:: " in line.lower():
                phrases_new.append(line.split("::")[1].strip())
            elif "word:: " in line.lower():
                words_new.append(line.split("::")[1].strip())

quote_file = "~/Data/Obsidian/second-brain/Quotes.md"
quote_file = os.path.expanduser(quote_file)
phrase_file = "~/Data/Obsidian/second-brain/Phrases.md"
phrase_file = os.path.expanduser(phrase_file)
word_file = "~/Data/Obsidian/second-brain/Words.md"
word_file = os.path.expanduser(word_file)

with open(quote_file, 'r+') as f:
    quotes_from_file = [line.strip() for line in f.readlines() if line != "\n"]

with open(phrase_file, 'r+') as f:
    phrases_from_file = [line.strip() for line in f.readlines() if line != "\n"]

with open(word_file, 'r+') as f:
    words_from_file = [line.strip() for line in f.readlines() if line != "\n"]

for quote in quotes_new:
    if quote not in quotes_from_file:
        print("Adding quote: " + quote)
        with open(quote_file, 'a') as f:
            f.write("\n" + quote + "\n")

for phrase in phrases_new:
    if phrase not in phrases_from_file:
        print("Adding phrase: " + phrase)
        with open(phrase_file, 'a') as f:
            f.write("\n" + phrase + "\n")

for word in words_new:
    if word not in words_from_file:
        print("Adding word: " + word)
        with open(word_file, 'a') as f:
            f.write("\n" + word + "\n")
