#
# Helpers for the spherical console; not used in that actual library code
#

require 'spherical'
begin
  require 'pp'
rescue LoadError
  true
end

def connect(opts = {})
  puts "Connecting to #{opts[:api]} as #{opts[:username]}"
  $host = Spherical::Host.new(:api => opts[:api],
                              :username => opts[:username],
                              :password => opts[:password])
  puts "Logged in. Use global variable $host"
end

connect :api => ENV["SPHERICAL_API"], :username => ENV["SPHERICAL_USER"], :password => ENV["SPHERICAL_PASSWORD"]
