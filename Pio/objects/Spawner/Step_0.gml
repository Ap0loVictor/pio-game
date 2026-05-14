_score = Pio._score
if(_score>=1000 && _score <= 1090){
	audio_play_sound(milpontos_sound, 10, false)
}
//aguia
/*
escolhe um dos 4 cantos da tela e gera uma aguia em um ponto aleatorio desse canto, andando
*/
flipaguia=false
if (random(2) <= 1){ //joga uma moeda
	xaguia = random(1366)
	xdirection_aguia = random_range(-1, 1)
	if(random(2) <= 1){
		//limite superior da tela
		yaguia = 0
		ydirection_aguia = random_range(0, 1)
	}else{
		//limite inferior da tela
		yaguia=768
		ydirection_aguia = random_range(-1, 0)
		flipaguia=true
	}
}else{ 
	yaguia = random(768)
	ydirection_aguia = random_range(-1, 1)
	if(random(2) <= 1){
		//limite esquerdo da tela
		xaguia = 0
		xdirection_aguia = random_range(0, 1)
	}else{
		//limite direito da tela
		xaguia=1366
		xdirection_aguia = random_range(-1, 0)
		flipaguia=true
	}
}

if (random(100) <= aguia_spawnrate){
	var new_aguia = instance_create_layer(x, y, "Instances", aguia, {
    
		xdirection: xdirection_aguia,
	    ydirection: ydirection_aguia,
	    _speed: random_range(1,5),
		x: xaguia,
		y:  yaguia,
		flip: flipaguia
	});
	audio_play_sound(hawk, 10, false)
	array_insert(aguias, -1, new_aguia)
	aguia_spawnrate -= 1
	if aguia_spawnrate <= 0{
		aguia_spawnrate = 0.1
	}
}else{
	aguia_spawnrate += _score*0.0003
}

//destruir aguias fora da tela
for (var i = array_length(aguias) - 1; i >= 0; i--){
	var a = aguias[i]
	if (a.x > 1366 || a.x < 0 || a.y < 0 || a.y > 768){
		instance_destroy(aguias[i])
		array_delete(aguias, i, 1)
	}
}
	
//bicada
/*
cria dois pontos em locais aleatórios da tela e conecta em uma linha(a bicada)
*/
//ponto inicial
if (random(2) <= 1){ //joga uma moeda
	x0bicada = random(1366)
	if(random(2) <= 1){
		//limite superior da tela
		startbicada = "superior"
		y0bicada = 0
	}else{
		//limite inferior da tela
		startbicada = "inferior"
		y0bicada=768
		ydirection_aguia = random_range(-1, 0)
	}
}else{ 
	y0bicada = random(768)
	if(random(2) <= 1){
		//limite esquerdo da tela
		startbicada = "esquerdo"
		x0bicada = 0
	}else{
		//limite direito da tela
		startbicada = "direito"
		x0bicada=1366
	}
}
//ponto final
if (random(2) <= 1){ //joga uma moeda
	x1bicada = random(1366)
	if((random(2) <= 1 && startbicada != "superior") || startbicada == "inferior"){
		//limite superior da tela
		y1bicada = 0
	}else{
		//limite inferior da tela
		y1bicada=768
	}
}else{ 
	y1bicada = random(768)
	if((random(2) <= 1 && startbicada != "esquerdo") || startbicada == "direito"){
		//limite esquerdo da tela
		x1bicada = 0
	}else{
		//limite direito da tela
		x1bicada=1366
	}
}
 
if (random(100) <= bicada_spawnrate){
	var new_bicada = instance_create_layer(x, y, "Instances", Bicada, {
    
		x0 : x0bicada,
		y0: y0bicada,
		x1: x1bicada,
		y1: y1bicada,
		timer: 2 
	});
	audio_play_sound(chicken, 10, false)
	array_insert(bicadas, -1, new_bicada)
	bicada_spawnrate -= 1
	if bicada_spawnrate <= 0{
		bicada_spawnrate = 0.1
	}
}else{
	bicada_spawnrate += _score*0.0001
}

//ovos dourados

//limite superior da tela
xgoldenegg = random(1366)
ygoldenegg = 0


if (random(100) <= goldenegg_spawnrate){
	var new_goldenegg = instance_create_layer(x, y, "Instances", OvoDourado, {
		x: xgoldenegg,
		y: ygoldenegg
	});
	audio_play_sound(loquendo_ovo_dourado, 10, false)
	array_insert(goldeneggs, -1, new_goldenegg)
	goldenegg_spawnrate = 0.001
}else{
	goldenegg_spawnrate += 0.0001
}

//milhos

//limite superior da tela
xmilho = random(1366)
ymilho = 0


if (random(100) <= milho_spawnrate){
	var new_milho = instance_create_layer(x, y, "Instances", milho, {
		x: xmilho,
		y: ymilho
	});
	array_insert(milhos, -1, new_milho)
	milho_spawnrate -= 1
	if milho_spawnrate <= 0{
		milho_spawnrate = 0.1
	}
}else{
	milho_spawnrate += 0.02
}