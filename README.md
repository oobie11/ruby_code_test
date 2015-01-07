This ruby module will parse a .conf file, here is how it works:

![alt text](/config_parse_action.png "Parsing in action")

### Start up irb
  `$ irb`

### Load the config_parser.rb file and module
  The `config_parser.rb` file need to be located in the same directory you run irb from


  `> load "config_parser.rb"`


  `> include ConfigParser`

### Run the parse_it method and assign it to a params variable
  The .conf file need to be in the same directory you are running irb from


  `> params = parse_it("test.conf")`

### Test it
  `> parms["host"]`
  returns "test.com"

  `> params["server_id"]`
  returns `55331` (a proper integer)

  `> params["server_load_alarm"]`
  returns `2.5` (a proper float)

  all `true/yes/on` values return the proper `true`
  
  all `false/no/off` values return the proper `false`
