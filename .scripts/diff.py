import subprocess
import re

repo_path = "/home/benjrise/Data/Obsidian/ml-notes/"
file_path = "/home/benjrise/Data/Obsidian/ml-notes/test.md"

def check_only_specific_lines_changed(repo_path, file_path):
    cmd = ["git", "-C", repo_path, "diff", "--cached", "--", file_path]
    diff_output = subprocess.check_output(cmd).decode('utf-8').strip()

    pattern = r"<!--SR:!\d{4}-\d{2}-\d{2},\d+,\d+-->"

    # Filter out lines with git meta info and '\ No newline at end of file'
    line_changes = [line for line in diff_output.split('\n') if line.startswith('+') or line.startswith('-')][2:]
    line_changes = [line for line in line_changes if line.strip() != r'\ No newline at end of file']
    line_changes = [line for line in line_changes if f"+{line[1:]}" not in line_changes or f"-{line[1:]}" not in line_changes]
    print(line_changes)

    specific_lines_changed = [re.search(pattern, change) is not None for change in line_changes]
    return all(specific_lines_changed)

if check_only_specific_lines_changed(repo_path, file_path):
    print("Only lines matching the pattern have changed.")
else:
    print("Other lines have also changed.")

