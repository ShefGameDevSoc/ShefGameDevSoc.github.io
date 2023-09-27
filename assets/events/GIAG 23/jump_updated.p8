pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
-- mario 2
-- by will

playerx = 20
playery = 0

function _init()
	--when program starts
end

--coodinate to background
function c2b(x)
	return (x+4)/8
end

--check collision
function solid(x, y)
	-- grab the cel value
	--majic numbers
	val=mget(c2b(x), c2b(y))
	
	if (fget(val,0)) then
		--play sound
		sfx(0)
		--set tile to 0
		mset(((x+4)/8), ((y+4)/8), 0)
	end
	
	
	--check if this is a wall
	return fget(val, 1)
end

--check collision bounds
function player_collides_wall()
	--get wether the player is
	--touching a wall tile
	--at any of the four
	--corners
	width = 1
	height = 1
	return 
		solid(
			playerx-width,
			playery-height)
	 or
		solid(
			playerx+width,
			playery-height)
		or
		solid(
			playerx-width,
			playery+height)
	 or
		solid(
			playerx+width,
			playery+height)
end

function try_move(x,y)
	playerx += x
	playery += y
	if (player_collides_wall()) then
		playerx -= x
		playery -= y
		return false
	end
	return true
end

function is_allowed_jump()
	playery += 1
	local result = player_collides_wall()
	playery -= 1
	return result
end

function _update()
	player_speed = 3
	
	--moving things around
	if(btn(1)) then  
 	try_move(player_speed,0)
 end
 
 --moving things around
	if(btn(0)) then  
 	try_move(-1*player_speed,0)
 end
 
 --control jumping
 jump_height = 20
 if (btnp(4) and is_allowed_jump()) then
 	--check how high we can jump
  for c=1,jump_height do
   try_move(0,-1)
  end
 end
 
 fall_speed = 1
 try_move(0,fall_speed)
end

function _draw()
	cls()
	map()
	--drawing things to screen
	spr(0,playerx,playery-2)
end
__gfx__
77700777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
7e7007e7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
7e7777e7000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
77707077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07770770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00777700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00777700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bbbbbbbb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bbbbbbbb0aaaaaa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
44b444bb0a9999a00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
444848440a9aaaa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
484444440a9aaaa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
444448440a9999a00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
484444440aaaaaa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
44444448000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__gff__
0000000000000000000000000000000002010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000110000000000111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
000100001d1501f1501f1501e1501c150211500000000000000000000000000000000000000000000000000000000000002810000000000000000000000000000000000000000000000000000000000000000000
