key_right = (keyboard_check(ord("D")) || keyboard_check(vk_right))
key_left = (keyboard_check(ord("A")) || keyboard_check(vk_left))
key_jump = (keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up))
key_down = (keyboard_check_pressed(ord("S"))|| keyboard_check_pressed(vk_down))
if(_goldeneggs>= 3){
	double_jump_unlocked = true
}

_speed = 4
horizontal_movement = key_right - key_left
xspeed = horizontal_movement * _speed

var _col_x = instance_place(x + xspeed, y, Ground)
if (_col_x != noone && _col_x.object_index != Platform) {
	while (!place_meeting(x + sign(xspeed), y, _col_x)) {
		x += sign(xspeed)
	}
	xspeed = 0
}
is_moving=false
is_jumping=false
if xspeed != 0{
	is_moving=true
}
x += xspeed

yspeed += 0.5


var _colisao_chao = instance_place(x, y + yspeed, Ground)
if (_colisao_chao != noone)  {
	var _ignorar_colisao = false
	
	if (_colisao_chao.object_index == Platform) {
		if (yspeed < 0) {
			_ignorar_colisao = true
		}
		else if (bbox_bottom > _colisao_chao.bbox_top) {
			_ignorar_colisao = true
		}
		else if (key_down) {
			_ignorar_colisao = true
		}
	}
	
	if (!_ignorar_colisao) {
		while (!place_meeting(x, y + sign(yspeed), Ground)) {
			y += sign(yspeed)
		}
		yspeed = 0
		if(restore_double_jump==true){
			can_double_jump=true
			restore_double_jump=false
		}
		
		if (key_jump) {
			is_jumping = true
			audio_play_sound(jump, 10, false)
			yspeed = -10
		}
	}
}else{
	if (double_jump_unlocked && can_double_jump==true && key_jump){
		audio_play_sound(jump, 10, false)
		is_jumping=true
		yspeed -= 10
		can_double_jump= false
		restore_double_jump=true
}
}
y += yspeed

if (place_meeting(x, y, aguia)) {
    // Muda instantaneamente para a sala de Game Over
    room_goto(rm_gameover);
}