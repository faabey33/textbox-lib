love.window.setTitle("LOVE zombie");
love.window.setMode(1280,720);

require "textbox";

function love.load()
	textbox:init();
	textbox:newBox(100,200,200,20,1,"");

	textbox:newBox(400,200,200,20,1,"");


end

function love.update(dt)



	textbox:update();




end





function love.draw()

	textbox:draw();


	love.graphics.print(textbox.boxCount, 0, 0);

	love.graphics.print(textbox.selectedBox, 100, 100);

end


--from https://love2d.org/wiki/String_extensions

local meta = getmetatable("") -- get the string metatable
 
meta.__add = function(a,b) -- the + operator
    return a..b
end
 
meta.__sub = function(a,b) -- the - operator
    return a:gsub(b,"")
end
 
meta.__mul = function(a,b) -- the * operator
    return a:rep(b)
end
 
-- if you have string.explode (check out the String exploding snippet) you can also add this:
meta.__div = function(a,b) -- the / operator
    return a:explode(b)
end
 
meta.__index = function(a,b) -- if you attempt to do string[id]
    if type(b) ~= "number" then
        return string[b]
    end
    return a:sub(b,b)
end