#!/usr/bin/env ruby

# Regular expression to match one or more occurrences of any character
regex = /^.+$/

# Get the input from ARGV
input = ARGV[0]

# Match the input with the regular expression
if regex.match(input)
  puts "Match"
else
  puts "No match"
end

