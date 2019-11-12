require 'json'

class Session
  # find the cookie for this app
  # deserialize the cookie into a hash
  def initialize(req)
    @cookies = req.cookies['_rails_lite_app']

    if @cookies.nil?
      @cookies = {} 
    else
      @cookies = JSON.parse(@cookies)
    end

  end

  def [](key)
    @cookies[key]
    #return value of that key
  end

  def []=(key, val)
    @cookies[key] = val
  end

  # serialize the hash into json and save in a cookie
  # add to the responses cookies
  def store_session(res)
    res.set_cookie('_rails_lite_app', {
      path: '/',
      value: @cookies.to_json
    })
  end
end
