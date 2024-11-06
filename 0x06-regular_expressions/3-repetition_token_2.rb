#!/usr/bin/env ruby

# Regular expression to match "hbn" with at least one `b` in between
regex = /h+b+n/

# Check if the input string matches the regex
if ARGV[0] =~ regex
  puts "hbn"
else
  puts ""
end
