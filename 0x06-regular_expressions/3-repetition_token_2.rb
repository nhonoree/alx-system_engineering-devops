#!/usr/bin/env ruby

# Regular expression to match strings with "a" followed by one or more "b's" followed by "a"
regex = /ab+a/

# Check if the input string matches the regex
if ARGV[0] =~ regex
  puts "Match"
else
  puts "No match"
end
