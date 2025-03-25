

if (Draw_Flash) {
	if (room == ROOM_002_Intro_Video
	|| room == ROOM_004_Intro_Video_2) {
		if (opacity < .75) {
			opacity += .19;
		}
	}

	if (room == ROOM_005_Intro_Video_3) {
		if (opacity < 1) {
			opacity += .005;
		}
	}


	// Draws a single white pixel sprite across the screen and blends it with the desired color to the alpha "a"
	draw_sprite_ext(SPR_wPixel, 0, 0, 0, 1080, 1080, 0, c_white, opacity);
}