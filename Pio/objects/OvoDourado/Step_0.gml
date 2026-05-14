if (!(place_meeting(x, y+yspeed, Ground))){
	yspeed += 0.5
}else{
	yspeed = 0
}
y += yspeed
if place_meeting(x, y, Pio){
	Pio._score += 100
	Pio._goldeneggs += 1 
	instance_destroy(self)
}