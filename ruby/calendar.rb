require 'date'
require 'optparse'

options = {}
OptionParser.new do |opt|
  opt.on('--month MONTH', 'Specify the month (1..12)') do |month|
    options[:month] = month
  end
end.parse!

options[:month] = Date.today.month if options[:month].nil?

unless (1..12).include?(options[:month].to_i)
  raise "#{options[:month]} is neither a month number (1..12) nor a name"
end

date = Date.new(Date.today.year, options[:month].to_i, 1)

puts date.strftime('%B %Y').center(20)
puts "月 火 水 木 金 土 日"

first_day = date.wday
print "   " * first_day

last_day = Date.new(date.year, date.month, -1)

(date..last_day).each do |day|
  print day.day.to_s.rjust(2) + " "
  print "\n" if day.saturday?
end

puts "\n" unless last_day.saturday?