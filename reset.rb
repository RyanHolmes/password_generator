require 'io/console'
require 'openssl'

# After 1 minute, password is wiped from clipboard
# puts Process.pid
sleep 5
IO.popen('pbcopy', 'w') { |f| f << "60 Seconds Passed" }
