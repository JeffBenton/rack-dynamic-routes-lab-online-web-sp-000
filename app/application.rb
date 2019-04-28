require 'pry'
class Application
  
  @@items = []
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    if req.path.match(/items/)
      search_item = req.path.split("/items/").last
      @@items.each do |item|
        if item.name == search_item
          resp.write "#{item.price}"
          resp.status = 200
          return
        end
      end
    elsif
      resp.write "Route not found"
      resp.status = 404
    end
    
    resp.finish
  end
end