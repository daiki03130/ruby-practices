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

first_day = Date.new(year, month, 1)
first_wday = first_day.wday

last_day = Date.new(year, month, -1)
days_in_month = last_day.mday

title = "#{month}月 #{year}".center(20)
week_header = "日 月 火 水 木 金 土 "
puts title.center(week_header.length)
puts week_header

first_wday.times do
  print "   "
end

(1..days_in_month).each do |n|
  if n < 10
    print " #{n} "
  else
    print "#{n} "
  end

  if (first_wday + n) % 7 == 0
    print "\n"
  end
end

puts
