-----------------------------------------------------------------------------------------
-- Title: WhackAMole
-- Name: Avery Mack
-- Course: ICS2O/3C
-- Date: April 4, 2018
-- This program places a random object on the screen. If the user clicks on it in time, the score increses 
-- by 1.
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

-- hide the staus bar 
display.setStatusBar(display.HiddenStatusBar)

-- creating background
local bkg = display.newRect( 0, 0, display.contentWidth, display.contentHeight) 

	-- setting color
	bkg:setFillColor( 0.5, 1, 0 )

	-- setting position
	bkg.anchorX = 0 
	bkg.anchorY = 0 
	bkg.x = 0 
	bkg.y = 0 

-- creating mole
local mole = display.newImage( "Images/mole.png" , 0, 0 )

	-- setting position
	mole.x = display.contentCenterX
	mole.y = display.contentCenterY

	-- scale down the size of the mole to be a third of its original size
	mole:scale( 0.3, 0.3 )

	-- make the mole invisible
	mole.isVisible = false 

-- add local variable to keep track of the score 
local points = 0
local pointsObject

-- display a points object and set the colour
pointsObject = display.newText( "0 ", 900, 700, nil, 100)
pointsObject:setTextColor(255/255, 255/255, 255/255)

--------------------------------Functions---------------------------------------------------------------

-- this function that makes a mole appear in a random (x,y) position on the screen
-- before calling the Hide function
function PopUp()

	-- choosing random position on the screen betweem 0 and the size of the screen 
	mole.x = math.random( 0, display.contentWidth)
	mole.y = math.random( 0, display.contentHeight)

	-- make the mole visible 
	mole.isVisible = true 

	-- call the hide function after 500 milliseconds 
	timer.performWithDelay( 500, Hide)
end 

-- this function calls the pop up function after 3 seconds 
function PopUpDelay()
	timer.performWithDelay( 3000, PopUp )
end

-- this function makes the mole invisible and then calls the pop up delay function
function Hide()
 	
 	-- changing visibility 
 	mole.isVisible = false 
 	PopUpDelay()
 end 

 -- this function starts the game 
 function GameStart()
 	PopUpDelay()
 end

 -- this function increments the score only if the mole is clicked. It displays the new score
 function Whacked( event )

 	-- if touch phase just started 
 	if (event.phase == "began") then
 		points = points + 1 
 		pointsObject.text = points 
 	end 

end 

----------------------------------------------Event Listeners----------------------------------------------
-- I add the event listener to the moles so that if the mole is touched, the Whacked function is called
mole:addEventListener( "touch", Whacked)

-------------------------------------------Start the Game---------------------------------------------------
-- call the function that starts the game 
GameStart()








