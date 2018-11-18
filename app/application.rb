require 'pry'

class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    item = req.path.split("/").pop
    # binding.pry
    if req.path.match(/items/)
      if @@items.include?(item)
        resp.write item.price
      else
        resp.write "Item not found"
             resp.status = 400
      end
      #if the item is in @@items, print the price
    #   @@items.each do |individual_item|
    #     if individual_item == item
    #       item.price
    #     else
    #       resp.write "Item not found"
    #       resp.status = 400
    #      end
    #   end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end
end
