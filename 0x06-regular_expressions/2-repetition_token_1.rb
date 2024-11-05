#!/usr/bin/env ruby

# Check if an argument is provided
if ARGV.length != 1
  puts "Usage: ruby 2-repetition_token_1.rb <string>"
  exit
end

# Get the input string from command line arguments
input_string = ARGV[0]

# Define the regular expression for matching characters
regex = /(.)\1+/

# Check if the input string matches the regex
if input_string.match?(regex)
  puts "Match"
else
  puts "No match"
end
