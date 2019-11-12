require 'rack'
require 'byebug'

app = Proc.new do |env|
    req = Rack::Request.new(env)
    res = Rack::Response.new
    # debugger
    res['Content-Type'] = 'text/html'
    if req.path_info == '/'
        res.write('Hello World!')
    else
        res.write(req.path_info)
    end
    res.finish
end

Rack::Server.start(
    app: app,
    Port: 3000
)