# [shell] create diff file
diff -y compared4 ticklist > vimcomp

# remove everything beginning in tab
sed "s/^[ \t]*//" -i vimcomp
:%s/^[ \t]*

# remove all tabs followed by another tab
:%s/\t[\t].*

# format csv into columns
# passes file to linux column function
:%!column -t -s ','
