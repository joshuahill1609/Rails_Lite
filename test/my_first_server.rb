require 'webrick'

root = File.expand_path '~/Desktop'

server = WEBrick::HTTPServer.new :Port => 8080, :DocumentRoot => root
trap 'INT' do server.shutdown end

server.start

server.mount_proc '/' do |req, res|

  res.body = HTTPRequest.path
  res.HTTPResponse.content_type = 'text/text'
end

