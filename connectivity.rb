require "mysql2"
puts "======== OUTPUT =========="
puts "mysql2 version: #{Gem.loaded_specs["mysql2"].version}"

#client = Mysql2::Client.new(:host => "socks-test.c5estleimm9p.us-east-1.rds.amazonaws.com:3306", :username => "connectivity", :password => "connectivitytest", :database => "connectivity")
client = Mysql2::Client.new(:host => "socks-test.c5estleimm9p.us-east-1.rds.amazonaws.com", :username => "socksdbadmin", :password => "socksdb_admin", :database => "connectivity")
results = client.query("SELECT 1+2")
results.each do |row|
  p row
end
