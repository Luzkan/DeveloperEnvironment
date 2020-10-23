# Script printouts all filenames in a given directory.
# input:      [directory]
# output:     [filename]

# Navigate to given directory
cd "$1"

# Printout the names of all the files
find -type f -printf "%f\n"
