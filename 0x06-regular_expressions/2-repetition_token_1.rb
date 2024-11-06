#!/usr/bin/env ruby

# Regular expression to match "hbbn"
regex = /hbbn/

# Check if the input string matches the regex
if ARGV[0] =~ regex
  puts "hbbn"
else
  puts ""
end
