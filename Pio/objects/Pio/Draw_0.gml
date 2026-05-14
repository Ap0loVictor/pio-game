draw_text(10, 10, "score: " + string(_score))
draw_text(10, 50, "ovos dourados: "+string(_goldeneggs)) 
xscaling = 3
//if xspeed < 0{
//	xscaling = -3
//}
if is_jumping==true && double_jump_unlocked==false{
	draw_sprite_ext(spr_pio_jump, -1, x, y, xscaling, 3, 0, c_white, 1)
}else if is_jumping==true && double_jump_unlocked==true{
	draw_sprite_ext(spr_pioo_jump, -1, x, y, xscaling, 3, 0, c_white, 1)
}else if is_moving==false && double_jump_unlocked==false{
	draw_sprite_ext(spr_pio_idle, -1, x, y, xscaling, 3, 0, c_white, 1)
}else if(is_moving==true && double_jump_unlocked==false){
	draw_sprite_ext(spr_pio_walk, -1, x, y, xscaling, 3, 0, c_white, 1)
}else if is_moving==false && double_jump_unlocked==true{
	draw_sprite_ext(spr_pioo_idle, -1, x, y, xscaling, 3, 0, c_white, 1)
}else if(is_moving==true && double_jump_unlocked==true){
	draw_sprite_ext(spr_pioo_walk, -1, x, y, xscaling, 3, 0, c_white, 1)
}
