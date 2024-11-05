#!/usr/bin/env ruby

# Check if exactly one argument is passed
if ARGV.length != 1
  puts "Usage: #{$0} <string>"
  exit 1
end

# Get the input string from the command line argument
input_string = ARGV[0]

# Define the regular expression
regex = /^(.*)\1$/

# Check if the input string matches the regular expression
if input_string.match?(regex)
  puts "Match found!"
else
  puts "No match."
end
