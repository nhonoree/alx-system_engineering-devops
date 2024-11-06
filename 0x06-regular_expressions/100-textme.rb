#!/usr/bin/env ruby

# Regular expression to capture the required fields
regex = /\[from:(\S+)\].*\[to:(\S+)\].*\[flags:([^\]]+)\]/

# Read the input from ARGV
input = ARGV[0]

# If the input matches the regex
if match = input.match(regex)
  # Output the matched groups in the desired format
  puts "#{match[1]},#{match[2]},#{match[3]}"
end
