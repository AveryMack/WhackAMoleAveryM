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

-- play background music
local backgroundMusic = audio.loadSound("sounds/backgroundMusic.mp3")
local backgroundMusicChannel
backgroundMusicChannel = audio.play(backgroundMusic) 


-- creating background
local bkg = display.newRect( 0, 0, display.contentWidth, display.contentHeight) 

	-- setting color
	bkg:setFillColor( 0/255, 109/255, 0/255 )

	-- setting position
	bkg.anchorX = 0 
	bkg.anchorY = 0 
	bkg.x = 0 
	bkg.y = 0 

-- creating horse
local horse = display.newImage( "Images/horse.png" , 0, 0 )

	-- setting position
	horse.x = display.contentCenterX
	horse.y = display.contentCenterY

	-- scale down the size of the horse to be a third of its original size
	horse:scale( 0.95, 0.95 )

	-- make the horse invisible
	horse.isVisible = false 

-- add local variable to keep track of the score 
local points = 0
local pointsObject

-- display a points object and set the colour
pointsObject = display.newText( "0 ", 525, 50, nil, 75)
pointsObject:setTextColor(155/255, 0/255, 131/255)

--------------------------------Functions---------------------------------------------------------------

-- this function that makes a horse appear in a random (x,y) position on the screen
-- before calling the Hide function
function PopUp()

	-- choosing random position on the screen betweem 0 and the size of the screen 
	horse.x = math.random( 0, display.contentWidth)
	horse.y = math.random( 0, display.contentHeight)

	-- make the horse visible 
	horse.isVisible = true 

	-- call the hide function after 500 milliseconds 
	timer.performWithDelay( 800, Hide)
end 

-- this function calls the pop up function after 3 seconds 
function PopUpDelay()
	timer.performWithDelay( 3000, PopUp )
end

-- this function makes the horse invisible and then calls the pop up delay function
function Hide()
 	
 	-- changing visibility 
 	horse.isVisible = false 
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
 		local whackSound = audio.loadSound("sounds/whack.mp3")
 		local whackSoundChannel
 		whackSoundChannel = audio.play(whackSound) 
 	end 

end 

----------------------------------------------Event Listeners----------------------------------------------
-- I add the event listener to the moles so that if the horse is touched, the Whacked function is called
horse:addEventListener( "touch", Whacked)

-------------------------------------------Start the Game---------------------------------------------------
-- call the function that starts the game 
GameStart()








