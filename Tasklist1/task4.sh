# Script printouts line number and contents of whole line for each found word.
# input:      [directory]
# output:     [path]:[line number]:[phrase]

# Navigate to given directory
cd "$1"

# -r          - recursivelly
# -w          - look for the whole word (ignoring substrings)
# -n          - and show associated line number
# [[:print:]] - all printable characters (due to words w/ '_' character)
#               could be [[:alpha:]] to show results without those
# *           - any file
grep -r -w -n '[[:print:]]*' *

# output:     [dir]:[line_num]:[whole_line]
