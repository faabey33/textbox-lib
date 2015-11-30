textbox = {}

function textbox:init()
	textbox.boxX = {}
	textbox.boxY = {}
	textbox.boxW = {}
	textbox.boxH = {}
	textbox.visibility = {}

	textbox.boxCount = 0;
	textbox.selectedBox = 0;
	textbox.boxhp = {}
	textbox.boxvp = {}
	textbox.font = {}

	textbox.text = {}
	textbox.style = {}



	mosuex = 0;
	mousey = 0;



end


function textbox:update()


	a = 0;
	while (a<self.boxCount) do

		mousex, mousey = love.mouse.getPosition();
		
		if (mousex>self.boxX[a] and mousex<self.boxX[a]+self.boxW[a] and mousey>self.boxY[a] and mousey<self.boxY[a]+self.boxH[a] and love.mouse.isDown("l")) then
			self.drag=true;
			self.selectedBox = a;
		end

		a=a+1;
	end


end

function textbox:delete()
	local string = textbox.text[textbox.selectedBox]

	if (#string > 0) then
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

			if self.style[i] == 0 then
				love.graphics.rectangle("line",self.boxX[i], self.boxY[i], self.boxW[i], self.boxH[i])
			elseif self.style[i] == 1 then
				love.graphics.draw(textbox1, self.boxX[i], self.boxY[i])
			elseif self.style[i] == 2 then
				love.graphics.draw(textbox2, self.boxX[i], self.boxY[i])
			end

			if self.font[i] == 0 then
				love.graphics.setFont(classyfont)
			elseif self.font[i] == 1 then
				love.graphics.setFont(defaultfont)
			elseif self.font[i] == 2 then
				love.graphics.setFont(coolfont)
			end
				love.graphics.printf(self.text[i], self.boxX[i]+self.boxhp[i], self.boxY[i]+self.boxvp[i], self.boxW[i]-2*self.boxhp[i], justify)
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

function textbox:newBox(boxX,boxY,boxW,boxH,visible,text,style,font,hp,vp)

	if hp ~= nil then
		self.boxhp[self.boxCount] = hp
	else
		self.boxhp[self.boxCount] = 0
	end
	if vp ~= nil then
		self.boxvp[self.boxCount] = vp
	else 
		self.boxvp[self.boxCount] = 0
	end

	self.font[self.boxCount] = font
	self.boxY[self.boxCount] = boxY
	self.boxH[self.boxCount] = boxH
	self.boxX[self.boxCount] = boxX
	self.boxW[self.boxCount] = boxW
	self.text[self.boxCount] = text
	self.style[self.boxCount] = style

	if (visible == 1) then
		self.visibility[self.boxCount] = true;
		elseif (visible == 0) then
			self.visibility[self.boxCount] = false;
		end

		self.boxCount = self.boxCount + 1;

end
