key_right = keyboard_check(ord("D"))
key_left = keyboard_check(ord("A"))
key_jump = keyboard_check(ord("W"))
key_down = keyboard_check(ord("S"))

_speed = 4
horizontal_movement = key_right - key_left
xspeed = horizontal_movement*_speed
x += xspeed	
if (!(place_meeting(x, y+yspeed, Ground)) || (place_meeting(x, y+yspeed, Platform) && key_down)){
	yspeed += 0.5
}else{
	yspeed = 0
	if (key_jump){
		audio_play_sound(jump, 10, false)
		yspeed -= 10
	}
}
y += yspeed
