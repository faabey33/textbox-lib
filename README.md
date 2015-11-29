# textbox-lib
super simple text areas for löve2d

use require "textbox" in main.lua

Creating a new Textbox
textbox.newBox( xPos, yPos, width, height, visible, "Text");

Visibilty
if visible is 1, the box is visible, 0 it is invisible
toggle visibility with textbox.visible

each box gets an ID (number starting from 0)
access textbox text with text = textbox.text[ID]
