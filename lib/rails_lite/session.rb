require 'json'
require 'webrick'

class Session
  def initialize(req)
    cookies = req.cookies
    current_cookie = cookies.find {|cookie| cookie.name == '_rails_lite_app'}
    if current_cookie.nil?
      @current = {}
    else
      @current = JSON.parse(current_cookie)
    end
  end

  def [](key)
    #session[key]
    @current[key]
  end

  def []=(key, val)
    @current[key] = val
  end

  def store_session(res)
    @current = @current.to_json
    res.cookies << WEBrick::Cookie.new('_rails_lite_app', @current.to_json)
  end
end
