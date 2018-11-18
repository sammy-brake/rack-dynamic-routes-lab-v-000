require 'pry'

class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    item = req.path.split("/").pop
    if req.path.match(/items/)
    else 
      resp.write "Route not found"
      resp.status = 404
    end
    #  if req.path.match(/items/)
    #    binding.pry
    #
    #     else
    #       resp.write "Item not found"
    #       resp.status = 400
    #     end
    #   else
    #   
    resp.finish
end
