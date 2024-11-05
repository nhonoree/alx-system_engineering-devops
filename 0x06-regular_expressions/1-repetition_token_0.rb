#!/usr/bin/env ruby

# Check if an argument is provided
if ARGV.length != 1
  puts "Usage: ruby 1-repetition_token_0.rb <string>"
  exit
end

# Get the input string from command line arguments
input_string = ARGV[0]

# Define the regular expression to match a character repeated at least twice
regex = /^(.)\1+$/

# Check if the input string matches the regex
if input_string.match?(regex)
  puts "Match"
else
  puts "No match"
end
