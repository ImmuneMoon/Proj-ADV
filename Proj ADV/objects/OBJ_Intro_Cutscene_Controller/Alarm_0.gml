Draw_Flash = false;

if (Draw_Flash == false) {
	if (room == ROOM_002_Intro_Video) {
		room_goto(ROOM_003_Intro_Video_1);
	}
	
	if (room == ROOM_004_Intro_Video_2) {
		room_goto(ROOM_005_Intro_Video_3);	
	}
	
	if (room == ROOM_005_Intro_Video_3) {
		room_goto(ROOM_006_Title_Screen);
	}
}