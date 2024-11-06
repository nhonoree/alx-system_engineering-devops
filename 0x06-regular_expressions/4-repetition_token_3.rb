#!/usr/bin/env ruby

# Regular expression to match "hbn" with 2 to 5 `b`s
regex = /h{1}b{2,5}n/

# Check if the input string matches the regex
if ARGV[0] =~ regex
  puts "hbn"
else
  puts ""
end
