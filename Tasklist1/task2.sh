# Script printouts how many times each words appears in files in a given directory.
# input:      [directory]
# output:     [total occurances in all files] [phrase]

# Navigate to given directory
cd "$1"

# Loop over all the files
for f in $(find -type f)
do
    tr ' ' '\n' < $f |          # Transform all blank spaces to newlines
        tr -s '\n' '\n' |       # Merge them together
        tr [:upper:] [:lower:]  # Remove case-sensitivity

# At this point, we are left with all words per file
done |
    sort |                      # Concatenates files while sorting their contents
    uniq -c                     # Print w/ prefix for # times line repeated in the searching data
