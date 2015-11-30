love.window.setTitle("LOVE zombie");
love.window.setMode(1280,720);

require "textbox";

function love.load()
	textbox:init();

	textbox:newBox(100,200,200,40,1,"Hello!",0,1,1,5,5);
	textbox:newBox(400,200,220,180,1,"",1,0,20,32);
	textbox:newBox(800,400,220,180,1,"",2,2,10,32);

	textbox1 = love.graphics.newImage("textbox1.png")
	textbox2 = love.graphics.newImage("textbox2.png")
	background = love.graphics.newImage("back.png")

	defaultfont = love.graphics.newFont(14)
	classyfont = love.graphics.newFont("Dosmilcatorce.ttf", 24)
	coolfont = love.graphics.newImageFont("imagefont.png",
    " abcdefghijklmnopqrstuvwxyz" ..
    "ABCDEFGHIJKLMNOPQRSTUVWXYZ0" ..
    "123456789.,!?-+/():;%&`'*#=[]\"")



    love.graphics.setFont(classyfont)

end

function love.update(dt)


	textbox:update();


end

function love.keypressed(k)
	if k == "backspace" then
		textbox:delete()
	end	
end





function love.draw()

	love.graphics.draw(background, 0, 0)

	textbox:draw();



	love.graphics.print(textbox.boxCount, 0, 0);

	love.graphics.print(textbox.selectedBox, 100, 100);

end