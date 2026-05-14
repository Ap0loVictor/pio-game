if (!(place_meeting(x, y+yspeed, Ground))){
	yspeed += 0.5
}else{
	yspeed = 0
}
y += yspeed
if place_meeting(x, y, Pio){
	Pio._score += 10
	audio_play_sound(milho_sound, 10, false)
	instance_destroy(self)
}