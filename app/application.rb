class Application

  @@items = [Item.new("Carrots",510),Item.new("Pineapple",750)]

  def call(env)
    resp = Rack::Response.new # output
    req = Rack::Request.new(env) # input

    if req.path.match(/items/) # if input path matches (/items/)
      item_name = req.path.split("/items/").last
      # strip the link and return the item text at the end
      if item = @@items.find {|item| item.name == item_name}
        # return first item that matches item name being searched for
        resp.write item.price
        # print the price
      else
        resp.write "Item not found"
        # if the input doesn't match print message
        resp.status = 400 # request contains bad syntax and can't be completed
      end
    else
      resp.write "Route not found"
      resp.status = 404 # request contains bad syntax and can't be completed
    end
    resp.finish # trigger the responses
  end
end
