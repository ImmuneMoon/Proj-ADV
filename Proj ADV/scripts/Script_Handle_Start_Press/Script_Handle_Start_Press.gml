// For user presses longer than 100ms, to ensure no accidental keypresses and command overlap
function Script_Handle_Start_Press() {
	show_debug_message("#### --- Script_Handle_Start_Press --- ####");
	// Go to Intro Video from Studio Screen
    if (room == ROOM_001_Studio_Screen) {
        room_goto(ROOM_002_Intro_Video);
		show_debug_message("Going to Intro video");
    }
	// Go to Title Screen from Intro Video
    if (room == ROOM_002_Intro_Video
        || room == ROOM_003_Intro_Video_1
        || room == ROOM_004_Intro_Video_2
        || room == ROOM_005_Intro_Video_3) {
        room_goto(ROOM_006_Title_Screen);
		show_debug_message("Going to Title screen");
    }
	// Go to game room from Title Screen
    if (room == ROOM_006_Title_Screen) {
		show_debug_message("Playing Start Sound");
		// Play start sound
		if (!audio_is_playing(SND_PKMN_384_Rayquaza_Start_Sound)) {
			// Play sound
			audio_play_sound(SND_PKMN_384_Rayquaza_Start_Sound, 8, false);
			// Volume (5%)
			audio_sound_gain(SND_PKMN_384_Rayquaza_Start_Sound, .05, 0);
		}
		if (alarm[1] < 0) {
			alarm[1] = 100;
		}
    }
	else {
		global.display_start_menu = true;
		show_debug_message("Setting global display_start_menu to true");
	}
}