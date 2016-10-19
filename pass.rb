#set number of characters (-n 12)
#handle special character and capital letter requests always
require 'io/console'
require 'openssl'
require_relative 'spinner'

def shrink num
  # something
end

# ARGV.each{ |a| puts "Argument: #{a}" }
arguments = ARGV

print 'Program: '
program = STDIN.gets.to_s.chomp
print 'Password: '
password = STDIN.noecho(&:gets).chomp
puts ''

hash = OpenSSL::Digest::SHA1.new(program + password)

if arguments.include? "-n"
  # get the number and shrink hash - add capital and special character (currently 40 characters)
  # 2866adb46f6ae98189eb415101a7db306da5196b
else
  # limit hash to 16 characters?
  IO.popen('pbcopy', 'w') { |f| f << hash }
  puts "You have 1 minute."
end

# After 1 minute, password is wiped from clipboard
spinner(5) #spinner
IO.popen('pbcopy', 'w') { |f| f << "60 Seconds Passed" }
