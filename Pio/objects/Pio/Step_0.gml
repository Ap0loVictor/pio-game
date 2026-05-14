key_right = (keyboard_check(ord("D")) || keyboard_check(vk_up))
key_left = keyboard_check(ord("A"))
key_jump = keyboard_check_pressed(ord("W"))
key_down = keyboard_check(ord("S"))
if(_goldeneggs>= 3){
	double_jump_unlocked = true
}

_speed = 4
horizontal_movement = key_right - key_left
xspeed = horizontal_movement*_speed
x += xspeed	
if (!(place_meeting(x, y+yspeed, Ground)) || (place_meeting(x, y+yspeed, Platform) && key_down)){
	if (double_jump_unlocked && can_double_jump==true && key_jump){
		yspeed -= 10
		can_double_jump= false
		restore_double_jump=true
	}else{
		yspeed += 0.5
	}
}else{
	yspeed = 0
	if(restore_double_jump==true){
		can_double_jump=true
		restore_double_jump=false
	}
	if (key_jump){
		audio_play_sound(jump, 10, false)
		yspeed -= 10
	}
}
y += yspeed
