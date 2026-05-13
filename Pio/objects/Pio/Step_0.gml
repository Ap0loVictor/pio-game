key_right = keyboard_check(ord("D"))
key_left = keyboard_check(ord("A"))
key_jump = keyboard_check(ord("W"))
key_down = keyboard_check(ord("S"))

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
x += xspeed

yspeed += 0.5

var _colisao_chao = instance_place(x, y + yspeed, Ground)
if (_colisao_chao != noone) {
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
		
		if (key_jump) {
			audio_play_sound(jump, 10, false)
			yspeed = -10
		}
	}
}
y += yspeed