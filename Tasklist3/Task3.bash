# Script printouts in how many files each word appeard in, in a given directory.
# input:      [revision] [remote svn repository url]
# output:     [found in number of files] [phrase]

# Clone the repository to a temporary folder
svn checkout -q -r "$1" "$2" temp

# Navigate to given directory
cd temp

# Loop over all the files except the svn folders
for f in $(find . -not -path "./.svn/*" -type f)
do
    tr ' ' '\n' < $f |            # Transform all blank spaces to newlines
        tr -s '\n' '\n' |         # Merge them together
        tr [:upper:] [:lower:] |  # Remove case-sensitivity
        sort -u                   # Remove all duplicates

# At this point, we are left with unique words per file
done |
    sort |                        # Concatenates files while sorting their contents
    uniq -c                       # Print w/ prefix for # times line repeated in the searching data

# Cleanup after script finishes it's job
cd ..
rm -rf temp

