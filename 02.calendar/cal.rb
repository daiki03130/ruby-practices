#!/usr/bin/env ruby
require "optparse"
require "date"

month = Date.today.month
year = Date.today.year

OptionParser.new do |opt|
  opt.on("-m MONTH", "--month MONTH", Integer, "受け取った月") do |m|
    month = m
  end

  opt.on("-y YEAR", "--year YEAR", Integer, "年を指定") do |y|
    year = y
  end
end.parse!

abort "1〜12の月を指定してください" unless (1..12).include?(month)
abort "1970〜2100の年を指定してください" unless (1970..2100).include?(year)

first_date = Date.new(year, month, 1)
last_date = Date.new(year, month, -1)

title = "#{month}月 #{year}"
week_header = "日 月 火 水 木 金 土 "
puts title.center(week_header.length)
puts week_header

print "   " * first_date.wday

(first_date..last_date).each do |date|
  print "#{date.day.to_s.rjust(2)} "
  print "\n" if date.saturday?
end

puts
