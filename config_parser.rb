module ConfigParser
  def convert_numbers(string)
    Integer(string) rescue Float(string) rescue string
  end

  def parse_it(file)
    holding_array = Array.new
    params = Hash.new

    text = File.open(file).read
    text.gsub!(/\r\n?/, "\n")
    text.each_line do |line|
      #skip comment lines
      if line.match(/^#/)
        next
      else
        #Get parameter and add it to the holding array
        holding_array[0],holding_array[1] = line.to_s.split("=")
        #Match our regular expression and substitute
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
