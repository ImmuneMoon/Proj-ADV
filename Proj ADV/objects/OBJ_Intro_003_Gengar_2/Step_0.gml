bounce_timer ++;
var inst = noone;

swipe_dist = OBJ_Intro_003_Gengar_2.x + OBJ_Intro_003_Gengar_2.sprite_width;
if (OBJ_Intro_003_Tall_Grass_Foreground.x <= 20 
&& OBJ_Intro_003_Tall_Grass_Foreground.x >= -40) {
	if (bounce_timer mod 60 < 20) {
		image_index = 1;
	}
	else {
		image_index = 0;
	}
}

if (OBJ_Intro_003_Tall_Grass_Foreground.x <= -40 
&& OBJ_Intro_003_Tall_Grass_Foreground.x >= -65) {
	image_index = 2;
}
if (OBJ_Intro_003_Tall_Grass_Foreground.x <= -65 
&& OBJ_Intro_003_Tall_Grass_Foreground.x >= -66) {
	image_index = 3;
}

if (OBJ_Intro_003_Tall_Grass_Foreground.x <= -67 
&& OBJ_Intro_003_Tall_Grass_Foreground.x >= -68) {
	if (inst == noone) {
		inst = instance_create_layer(swipe_dist, OBJ_Intro_003_Gengar_2.y, "Effects", OBJ_Swipe);
	}
}

if (OBJ_Intro_003_Tall_Grass_Foreground.x <= -69 
&& OBJ_Intro_003_Tall_Grass_Foreground.x >= -168) {
	if (bounce_timer mod 60 < 20) {
		image_index = 1;
	}
	else {
		image_index = 0;
	}
}