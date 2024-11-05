#!/usr/bin/env ruby

# Regular expression to match a character repeated at least twice
regex = /^(.)\1+$/

# Get the input string from command line arguments
input_string = ARGV[0]

# Check if the input string matches the regex
if input_string.match?(regex)
  puts "Match"
else
  puts "No match"
end
