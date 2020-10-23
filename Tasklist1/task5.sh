# Script makes replacement "a" -> "A" in each file contents in a given directory.
# input:      [directory]
# output:     ---

# Navigate to given directory
cd "$1"

# Replace "a" -> "A" in all files
# '{}'  - for each match
# \;    - prevent double parsing
find -type f -exec sed -i 's/a/A/g' '{}' \;
