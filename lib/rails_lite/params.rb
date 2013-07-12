require 'uri'

class Params
  def initialize(req, route_params=nil)
    @params = {}
    if req.body
      @params.merge!(parse_www_encoded_form(req.body))
    end
    if req.query_string
      query_string = req.query_string
      query = parse_www_encoded_form(query_string)
      @params.merge!(query)
    end
  end

  def [](key)
  end

  def to_s
    @params.to_json.to_s
  end

  private
  def parse_www_encoded_form(www_encoded_form)
    unless www_encoded_form.nil?
      hash = 'hahahaha'
      decoded_values = URI.decode_www_form(www_encoded_form)
      x = decoded_values.
      p x.first
      p x[1]
      p x.first.scan(\W?(\w+)\W?)
      # y = x.first.scan(/\w+/)
#       p y + x.last.scan(/\w+/)
#       no = y + x.last.scan(/\w+/)
#       a_hash = {no.first => {no.second => x[1]}}
#       p a_hash
      p "!!!!!!!!!"
      hash = Hash.new
      decoded_values.each do |keypair|
        hash[keypair.first] = keypair.last
      end

      #\W?(\w+)\W?
      hash
    end
  end

  def parse_key(key)

  end
end
