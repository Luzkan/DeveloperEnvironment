# Script prints each word with it's line number and filepath
# when the same word is found in the same line
# input:      [directory]
# output:     [dir]:[line_num]:[word]

# Navigate to given directory
cd "$1"

# -r          - recursivelly
# -w          - look for the whole word (ignoring substrings)
# -n          - and show associated line number
# -i          - ignore case-sensivity
# -o          - print for each found match in line (only matching)
# [[:alpha:]] - all alphabetic characters
# *           - any file

# uniq -d     - now print only those repeated lines (coming from -o)
grep -r -w -n -i -o '[[:alpha:]]*' * | uniq -d
