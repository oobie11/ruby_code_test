This ruby module will parse a config file, here is how it works:

Bryans-MBP:documents Bryan$ irb

irb(main):001:0> load "config_parser.rb"
=> true

irb(main):002:0> include ConfigParser
=> Object

irb(main):003:0> params = parse_it("test.conf")
=> {"host"=>"test.com", "server_id"=>55331, "server_load_alarm"=>2.5, "user"=>"user", "verbose"=>true, "test_mode"=>true, "debug_mode"=>false, "log_file_path"=>"/tmp/logfile.log", "send_notifications"=>true}

irb(main):004:0> params["host"]
=> "test.com"

irb(main):005:0> params["server_id"]
=> 55331

irb(main):006:0> params["server_load_alarm"]
=> 2.5

irb(main):007:0> params.each { |key, value| puts "#{key}: #{value}" }
host: test.com
server_id: 55331
server_load_alarm: 2.5
user: user
verbose: true
test_mode: true
debug_mode: false
log_file_path: /tmp/logfile.log
send_notifications: true
=> {"host"=>"test.com", "server_id"=>55331, "server_load_alarm"=>2.5, "user"=>"user", "verbose"=>true, "test_mode"=>true, "debug_mode"=>false, "log_file_path"=>"/tmp/logfile.log", "send_notifications"=>true}

irb(main):008:0> ^D

Bryans-MBP:documents Bryan$
