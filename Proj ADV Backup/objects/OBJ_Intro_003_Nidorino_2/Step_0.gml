// Initialize values
NidorinoX = OBJ_Intro_003_Nidorino_2.x;
NidorinoY = OBJ_Intro_003_Nidorino_2.y;

/* 
	Sprite timing is based on foreground grass x position, 
	can speed up and slow down both sprite's animation by 
	manipulating the speed of the grass traveling across 
	the x plane.
*/
tall_grass_X = OBJ_Intro_003_Tall_Grass_Foreground.x;

// Begin bounce timer, for moving sprite up and down
bounce_timer ++;

// Stops initial path
if (tall_grass_X >= 160
&& tall_grass_X == 10) {
	path_end();
}

// Begin open mouth
if (tall_grass_X <= 10 
&& tall_grass_X >= 0) {
	image_index = 1;
}

// Roar animation
if (tall_grass_X <= 0 
&& tall_grass_X >= -30) {
	image_index = 2;
	// Shakes pkmn
	if (bounce_timer % 2 == 0) {
		// Up
		y -= 1;
	}
	else {
		// Down
		y += 1;
	}
	// If the roar hasnt played, and its the frame after the animation begins, play it
	if (!audio_is_playing(SND_PKMN_033_Nidorino_Intro_Sequence)
	&& tall_grass_X <= -1
	&& tall_grass_X >= -2) {
		// Play sound
		audio_play_sound(SND_PKMN_033_Nidorino_Intro_Sequence, 8, false);
		// Volume (5%)
		audio_sound_gain(SND_PKMN_033_Nidorino_Intro_Sequence, .03, 0);
	}
	
}

// Make sure pkmn is stuck to the correct y after animation
if (tall_grass_X <= -31
&& tall_grass_X >= -32) {
	if (y != 68) {
		y = 68;
	}
}

// Close mouth
if (tall_grass_X <= -30 
&& tall_grass_X >= -60) {
	image_index = 0;
}
	
// Begin open mouth for jump
if (tall_grass_X <= -60
&& tall_grass_X >= -61) {
	image_index = 1;
}

// Dodge animation on Gengar swipe
if (tall_grass_X <= -65
&& tall_grass_X >= -75) {
	image_index = 0;
	path_start(PTH_Intro_003_Nidorino_2_1_Dodge, 4, path_action_stop, true);
	image_index = 3;
}

// Slide animation
if (tall_grass_X <= -75
&& tall_grass_X >= -85) {
	path_end();
	// Set to correct y
	if (y != 68) {
		y = 68;
	}
	image_index = 1;
	
	if (bounce_timer % 2 == 0) {
		x++;
		y -= .5;
		// After the first cloud is made
		if (instance_exists(OBJ_Dust_Clouds)) {
			// Spaces clouds out evenly based on the number of clouds
			next_cloudX = cloud_count * 12;
			NidorinoX += next_cloudX;
		}
		// Create clouds for slide effect
		inst = instance_create_layer(NidorinoX, 120, "Effects", OBJ_Dust_Clouds);
		// cloud_count records the amount of clouds made
		cloud_count ++;
	}
	else {
		x++;
		y += .5;
	}
}

if (tall_grass_X <= -86
&& tall_grass_X >= -87) {
	cloud_count = 0;
	inst = noone;
	if (y != 68) {
		y = 68;
	}
}

if (tall_grass_X <= -110
&& tall_grass_X >= -111) {
	image_index = 0;
}

if (tall_grass_X <= -112 
&& tall_grass_X >= -113) {
	image_index = 1;
}

// Jump back to pre swipe x
if (tall_grass_X <= -114
&& tall_grass_X >= -115) {
	image_index = 0;
	path_start(PTH_Intro_003_Nidorino_2_2_Dodge_2, 4, path_action_stop, true);
	image_index = 3;
	if (instance_exists(OBJ_Dust_Clouds)) {
		next_cloudX = cloud_count * 12;
		NidorinoX += next_cloudX;
	}
	inst = instance_create_layer(NidorinoX, 120, "Effects", OBJ_Dust_Clouds);
	cloud_count ++;
}

if (tall_grass_X <= -125
&& tall_grass_X >= -135) {
	path_end();
	cloud_count = 0; // Resets cloud cound
	inst = noone; // Clears the inst for next use
	image_index = 1;
}

if (tall_grass_X <= -136
&& tall_grass_X >= -137) {
	image_index = 0;
}

if (tall_grass_X <= -138
&& tall_grass_X >= -139) {
	image_index = 1;
}
// Small jump
if (tall_grass_X <= -140
&& tall_grass_X >= -141) {
	image_index = 3
	OBJ_Intro_003_Nidorino_2.x = 165;
	OBJ_Intro_003_Nidorino_2.y = 60;
}

// Land and cloud effect
if (tall_grass_X <= -143
&& tall_grass_X >= -144) {
	OBJ_Intro_003_Nidorino_2.x = 170;
	OBJ_Intro_003_Nidorino_2.y = 68;
	if (instance_exists(OBJ_Dust_Clouds)) {
		next_cloudX = cloud_count * 12;
		NidorinoX += next_cloudX;
	}
	inst = instance_create_layer(NidorinoX, 120, "Effects", OBJ_Dust_Clouds);
	cloud_count ++;
	
}

if (tall_grass_X <= -145
&& tall_grass_X >= -146) {
	cloud_count = 0;
	inst = noone;
}

if (tall_grass_X <= -147
&& tall_grass_X >= -148) {
	image_index = 1;
}

if (tall_grass_X <= -149
&& tall_grass_X >= -150) {
	image_index = 0;
}

if (tall_grass_X <= -151
&& tall_grass_X >= -152) {
	image_index = 1;
}

// Small jump 2
if (tall_grass_X <= -153
&& tall_grass_X >= -154) {
	image_index = 3
	OBJ_Intro_003_Nidorino_2.x = 175;
	OBJ_Intro_003_Nidorino_2.y = 60;
}

// Land and cloud effect
if (tall_grass_X <= -157
&& tall_grass_X >= -158) {
	OBJ_Intro_003_Nidorino_2.x = 180;
	OBJ_Intro_003_Nidorino_2.y = 68;
	if (instance_exists(OBJ_Dust_Clouds)) {
		next_cloudX = cloud_count * 12;
		NidorinoX += next_cloudX;
	}
	inst = instance_create_layer(NidorinoX, 120, "Effects", OBJ_Dust_Clouds);
	cloud_count ++;
}

if (tall_grass_X <= -159
&& tall_grass_X >= -160) {
	cloud_count = 0;
	inst = noone;
	image_index = 1;
}

// Side to side animation for final jump
if (tall_grass_X <= -162
&& tall_grass_X >= -163) {
	OBJ_Intro_003_Nidorino_2.x = 178; // Left
}

if (tall_grass_X <= -164
&& tall_grass_X >= -165) {
	OBJ_Intro_003_Nidorino_2.x = 182; // Right
}

if (tall_grass_X <= -166
&& tall_grass_X >= -167) {
	image_index = 1;
}

// Final Jump
if (tall_grass_X <= -168
&& tall_grass_X >= -169) {
	path_start(PTH_Intro_003_Nidorino_2_3_Jump, 4, path_action_stop, true);
	image_index = 4;
}
