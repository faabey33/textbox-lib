textbox = {}

function textbox:init()
	textbox.boxX = {}
	textbox.boxY = {}
	textbox.boxW = {}
	textbox.boxH = {}
	textbox.visibility = {}

	textbox.boxCount = 0;
	textbox.selectedBox = 0;

	textbox.text = {}



	mosuex = 0
	mousey = 0;



end


function textbox:update()


	a = 0;
	while (a<self.boxCount) do

		mousex, mousey = love.mouse.getPosition();
		
		if (mousex>self.boxX[a] and mousex<self.boxX[a]+self.boxW[a] and mousey>self.boxY[a] and mousey<self.boxY[a]+self.boxH[a] and love.mouse.isDown("l")) then
			self.selectedBox = a;
		end
		a=a+1;
	end

	if love.keyboard.isDown("backspace") then
		
		local string = textbox.text[textbox.selectedBox]

		string = string:sub( 1, #string - 1 )

		textbox.text[textbox.selectedBox] = string;
	end

end




function love.textinput(t)
	textbox.text[textbox.selectedBox] = textbox.text[textbox.selectedBox] .. t
end


function textbox:draw()

	i = 0;
	while (i <= self.boxCount) do
		if (self.visibility[i] == true) then
			love.graphics.rectangle("line",self.boxX[i], self.boxY[i], self.boxW[i], self.boxH[i])
			love.graphics.print(self.text[i], self.boxX[i], self.boxY[i])
		end
		i=i+1;
	end



end


function textbox.displayBox(boxCount,visible)
	
	if (visible == true) then
		self.visibility[self.boxCount] = true;
	elseif (visible == false) then
		self.visibility[self.boxCount] = false;
	end

end

function textbox:newBox(boxX,boxY,boxW,boxH,visible,text)
	
	self.boxX[self.boxCount] = boxX
	self.boxY[self.boxCount] = boxY
	self.boxH[self.boxCount] = boxH
	self.boxW[self.boxCount] = boxW
	self.text[self.boxCount] = text

	if (visible == 1) then
		self.visibility[self.boxCount] = true;
	elseif (visible == 0) then
		self.visibility[self.boxCount] = false;
	end

	self.boxCount = self.boxCount + 1;

end