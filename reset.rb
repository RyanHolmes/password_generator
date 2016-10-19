require 'io/console'
require 'openssl'
require_relative 'spinner'

# After 1 minute, password is wiped from clipboard
sleep 60
IO.popen('pbcopy', 'w') { |f| f << "60 Seconds Passed" }
