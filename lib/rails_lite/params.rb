require 'uri'

class Params
  def initialize(req)
    # @params = {}
    #add route_params back
    query_string = req.query_string
    @query = parse_www_encoded_form(query_string)
  end

  def [](key)
  end

  def to_s
    @query.to_json.to_s

  end

  private
  def parse_www_encoded_form(www_encoded_form)
    decoded_values = URI.decode_www_form(www_encoded_form)
    decoded_values

    hash = Hash.new
    decoded_values.each do |keypair|
      hash[keypair.first] = keypair.last
    end
    hash

  #   value = decoded_values.first
  #   second = decoded_values.last
  #   hash = Hash.new
  #   hash[first.first] = first.last
  #   hash[second.first.to_sym] = second.last
  #   hash
  end

  def parse_key(key)
  end
end
