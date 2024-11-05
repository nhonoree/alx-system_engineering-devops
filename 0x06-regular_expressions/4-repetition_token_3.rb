#!/usr/bin/env ruby

# Check if the argument is passed
if ARGV.length != 1
  puts "Usage: ruby 4-repetition_token_3.rb <string>"
  exit
end

# Regular expression to match the specified patterns
regex = /ab?|a(b{2,})/

# Check if the input matches the regex
if ARGV[0].match?(regex)
  puts "Match"
else
  puts "No match"
end
