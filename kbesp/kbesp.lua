-- This is a bit expensive for a UI application, but pebble.js pretty limited at the moment so just
-- sticking to standard http/ajax that is baked into pebble.js

srv=net.createServer(net.TCP) 
srv:listen(80,function(conn) 
  conn:on("receive",function(conn,payload) 
    
    -- GET /d5 HTTP/1.1
    -- GET /u5 HTTP/1.1
    command = string.sub(payload, 5,7) -- the bit after the slash
    print(payload) -- just pass it on the arduino 
    conn:send("OK"); -- and send something back to the pebble to say we got the command
  end) 
  conn:on("sent",function(conn) conn:close() end)
end)
