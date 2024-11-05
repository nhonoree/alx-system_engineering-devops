#!/usr/bin/env ruby

# Check if the argument is passed
if ARGV.length != 1
  puts "Usage: ruby 6-phone_number.rb <phone_number>"
  exit
end

# Regular expression to match a 10-digit phone number
regex = /^\d{10}$/

# Check if the input matches the regex
if ARGV[0].match?(regex)
  puts ARGV[0]
else
  puts ""
end
