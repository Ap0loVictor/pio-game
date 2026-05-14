 xspeed = xdirection*_speed
yspeed = ydirection*_speed
image_angle = point_direction(0, 0, xspeed, yspeed) 
if flip{
	image_yscale = -1
}
x += xspeed
y += yspeed

