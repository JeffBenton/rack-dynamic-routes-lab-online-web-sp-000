require 'pry'
class Application
  
  @@items = []
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    if req.path.match(/items/)
      item = req.path.split("/items/").last
      binding.pry
      if @@items.include?(item)
        resp.write "#{item.price}"
        resp.status = 200
      end
    elsif
      resp.write "Route not found"
      resp.status = 404
    end
    
    resp.finish
  end
end