if (random(2) <= 1){
	xaguia = random(1366)
	xdirection_aguia = random_range(-1, 1)
	if(random(2) <= 1){
		yaguia = 0
		ydirection_aguia = random_range(0, 1)
	}else{
		yaguia=768
		ydirection_aguia = random_range(-1, 0)
	}
}else{ 
	yaguia = random(768)
	ydirection_aguia = random_range(-1, 1)
	if(random(2) <= 1){
		xaguia = 0
		xdirection_aguia = random_range(0, 1)
	}else{
		xaguia=1366
		xdirection_aguia = random_range(-1, 0)
	}
}
if (random(100) <= 2){
	var inst = instance_create_layer(x, y, "Instances", aguia, {
    
		xdirection: xdirection_aguia,
	    ydirection: ydirection_aguia,
	    speed: 3,
		x: xaguia,
		y:  yaguia
	});
}