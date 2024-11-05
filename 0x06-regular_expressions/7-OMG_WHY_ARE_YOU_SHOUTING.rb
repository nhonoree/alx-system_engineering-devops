#!/usr/bin/env ruby

# Check if the argument is passed
if ARGV.length != 1
  puts "Usage: ruby 7-OMG_WHY_ARE_YOU_SHOUTING.rb <string>"
  exit
end

# Regular expression to match capital letters
regex = /[A-Z]+/

# Extract all uppercase letters and join them
result = ARGV[0].scan(regex).join

# Print the result
puts result
