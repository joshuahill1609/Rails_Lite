require 'json'
require 'webrick'

class Session
  def initialize(req)
    cookies = req.cookies
    cookies.each do |cookie|
      p cookie.name
      if cookie == '_rails_lite_app'
        current_cookie = _rails_lite_app
        p current_cookie.name
        p current_cookie.value
      end
    end
    if current_cookie
      @current = JSON.parse(current_cookie)
    else
      @current = {}
    end
    p @current
  end

  def [](key)
    #session[key]
  end

  def []=(key, val)
  end

  def store_session(res)
  end
end
