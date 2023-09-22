import os.path
import datetime

file_path = ".bashrc"

# Get the last modified time (Unix timestamp)
timestamp = os.path.getmtime(file_path)

# Convert the timestamp to a human-readable date format
last_modified_date = datetime.datetime.fromtimestamp(timestamp)

print("Last modified date:", last_modified_date)

