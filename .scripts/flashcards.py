import os
import re
import yaml

def format_frontmatter(frontmatter):
    for key, value in frontmatter.items():
        if isinstance(value, list):
            frontmatter[key] = '[{}]'.format(', '.join(value))
    return yaml.dump(frontmatter, default_flow_style=False).replace("'", "")

def find_question_mark_files(directory):
    pattern = r'\n\?\n'  # Matches a paragraph, a newline, a '?', another newline, and a paragraph
    pattern_flashcard = r'#flashcards'
    frontmatter_pattern = r'---(.*?)---'  # Matches the front matter

    for dirname, _, filenames in os.walk(directory):
        for filename in filenames:
            if not filename.endswith(".md"):
                continue

            filepath = os.path.join(dirname, filename)
            with open(filepath, 'r') as f:
                contents = f.read()

            if not re.search(pattern, contents):
                continue

            if re.search(pattern_flashcard, contents):
                continue

            frontmatter_match = re.search(frontmatter_pattern, contents, re.DOTALL)
            if frontmatter_match is None:
                frontmatter = {'tags': ['flashcards']}
            else:
                frontmatter = yaml.safe_load(frontmatter_match.group(1))
                if 'tags' in frontmatter:
                    if 'flashcards' in frontmatter['tags']:
                        continue
                    else:
                        frontmatter['tags'].append('flashcards')
                    
                if 'tags' not in frontmatter:
                    frontmatter['tags'] = ['flashcards']
                    
                

        
            # Reformat the tags as a single-line string
            new_matter = format_frontmatter(frontmatter)
            print(new_matter)
            new_contents = re.sub(frontmatter_pattern, f"---\n{new_matter}---", contents, flags=re.DOTALL)
            
            # with open(filepath, 'w') as f:
            #     f.write(new_contents)
            # print(new_contents)

if __name__ == "__main__":
    notes_path = "~/Data/Obsidian/ml-notes/"
    notes_path = os.path.expanduser(notes_path)
    find_question_mark_files(notes_path)
