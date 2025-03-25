

if (room == ROOM_002_Intro_Video) {
	first_6_image_count = OBJ_Intro_000_first_6_frames.image_index;
	if (first_6_image_count == 5) {
		Draw_Flash = true;
		// go to next room
		if (alarm[0] < 0) {
			alarm[0] = 3;
		}
	}
}
if (room == ROOM_003_Intro_Video_1) {
	if (OBJ_Intro_001_Forest_background_1.x > -1) {
		room_goto(ROOM_004_Intro_Video_2);
	}
}
if (room == ROOM_004_Intro_Video_2) {
	if (OBJ_Intro_002_Nidorino_Background.y > 16) {
		Draw_Flash = true;
		// go to next room
		if (alarm[0] < 0) {
			alarm[0] = 3;
		}
	}
}
if (room == ROOM_005_Intro_Video_3) {
	if (OBJ_Intro_003_Tall_Grass_Foreground.x <= -190) {
		Draw_Flash = true;
	}
	// go to next room
	if (opacity == 1) {
		// go to next object
		if (alarm[0] < 0) {
			alarm[0] = 100;
		}
	}
}
if (room == ROOM_006_Title_Screen) {
	Draw_Flash = false;
}