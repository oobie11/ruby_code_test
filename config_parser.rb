##This is a very simple method for parsing configuration file
##and returning its parameters in a hash
##Numeric values are presented as integers and floats acordingly
##All boolean type values (true/false, yes/no, on,off) are presented as proper true or false

module ConfigParser
  def convert_numbers(string)
    Integer(string) rescue Float(string) rescue string
  end

  def parse_it(file)
    holding_array = Array.new
    params = Hash.new

    unless File.exists?(file) then
      raise "The configuration file doesn’t exist!"
    end

    text = File.open(file).read
    text.gsub!(/\r\n?/, "\n")
    text.each_line do |line|
      #skip comment lines
      if line.match(/^#/)
        next
      else
        #Get parameter and add it to the holding array
        holding_array[0],holding_array[1] = line.to_s.to_s.scan(/^.*$/).to_s.split("=")

        #Match remove unwanted charactors
        holding_array.collect! do |val|
          val.gsub(/\s+|"|\[|\]/, "")
        end
        #Add the variables to our params hash
        params[holding_array[0]] = holding_array[1]
      end
    end

    params.update(params){|k,v| convert_numbers(v)}
    params.update(params) do |k, v|
      if v == "true" || v == "on" || v == "yes"
        v = true
      elsif v == "false" || v == "off" || v == "no"
        v = false
      else
        v = v
      end
    end

    return params
  end
end
