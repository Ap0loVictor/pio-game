var prebicada = instance_create_layer(x, y, "Instances", Prebicada,  {
	x0pre: x0,
	y0pre: y0,
	x1pre: x1,
	y1pre: y1,
	timer: self.timer
})
alarm[0] = game_get_speed(gamespeed_fps)*timer