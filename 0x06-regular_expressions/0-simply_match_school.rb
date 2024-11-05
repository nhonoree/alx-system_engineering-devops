#!/usr/bin/env ruby

# The regular expression to match "School"
regex = /School/

# Get the argument from the command line
input_string = ARGV[0]

# Use the regex to find matches and print them
matches = input_string.scan(regex).join

# Print the matches followed by a newline
puts matches
