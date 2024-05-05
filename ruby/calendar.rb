require "date"
require "optparse"

def print_calendar(year, month)
    first_day = Date.new(year, month, 1)
    last_day = Date.new(year, month, -1)

    puts "  #{month}月 #{year}  "
    puts "月 火 水 木 金 土 日"

    print "  "* first_day.wday

    (first_day..last_day).each do |date|
        print date.day.to_s.rjust(2) + " "
        puts if date.sunday?
    end

    puts
end

options = {}
opt = OptionParser.new
opt.on("-m month", Integer) { |month| options[:month] = month }
opt.parse!(ARGV)

now = Date.today
year = now.year

month = options[:month] || now.month

if month < 1 || 12 < month
    puts "#{month} is neither a month number (1..12) nor a name"
    exit
end

print_calendar(year, month)