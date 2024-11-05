#!/usr/bin/env ruby

# Check if the argument is passed
if ARGV.length != 1
  puts "Usage: ruby 5-beginning_and_end.rb <string>"
  exit
end

# Regular expression to match the pattern
regex = /^h.n$/

# Check if the input matches the regex
if ARGV[0].match?(regex)
  puts ARGV[0]
else
  puts ""
end
