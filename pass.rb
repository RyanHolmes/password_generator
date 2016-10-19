require 'io/console'
require 'openssl'
require_relative 'spinner'

def shrink num
  # something
end

arguments = ARGV

print 'Program: '
program = STDIN.gets.to_s.chomp
print 'Password: '
password = STDIN.noecho(&:gets).chomp
puts ''

hash = OpenSSL::Digest::SHA1.new(program + password)
# hash to base64
hash_64 = [[hash.to_s].pack("H*")].pack("m0")

if arguments.include? "-n"
  # TODO: get the number and shrink hash - add capital and special character (currently 40 characters)
else
  # limit hash to 16 characters?
  IO.popen('pbcopy', 'w') { |f| f << hash_64 }
  puts "You have 1 minute."
end

# After 1 minute, password is wiped from clipboard
spinner(60)
IO.popen('pbcopy', 'w') { |f| f << "60 Seconds Passed" }
