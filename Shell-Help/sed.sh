# sed
# get lines of file that substring from 5th to 7th is 'abc'
# -r means use regular expressions
# -n means only print matched lines
# function p means print
sed -r -n '/^.{4}abc.*/p' <filename>

# sed
# replace all space or other blank characters with '|'
sed -r 's/\s+/|/g' <filename>
