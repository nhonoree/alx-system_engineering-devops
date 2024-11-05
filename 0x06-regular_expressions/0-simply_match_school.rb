#!/usr/bin/env ruby

# Check if an argument is provided
if ARGV.length != 1
  puts "Usage: ruby 0-simply_match_school.rb <string>"
  exit
end

# Get the input string from command line arguments
input_string = ARGV[0]

# Define the regular expression for matching "School"
regex = /School/

# Check if the input string matches the regex and print the matches
matches = input_string.scan(regex)
if matches.any?
  puts matches.join
else
  puts ""
end
