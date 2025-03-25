global.right_key = keyboard_check(vk_right);
global.left_key   = keyboard_check(vk_left);
global.up_key     = keyboard_check(vk_up);
global.down_key   = keyboard_check(vk_down);
global.A_key = keyboard_check(vk_pagedown);
global.B_key = keyboard_check(vk_shift);
global.start_key  = keyboard_check(vk_enter);
global.select_key = keyboard_check(vk_escape);
global.direction_keypress = global.right_key || global.left_key || global.up_key || global.down_key;

show_debug_message("[Game Controller - End Step] Globals - right_key: " + string(global.right_key) + ", left_key: " + string(global.left_key));

// Check for Enter key press and process long press only once per press.
if (global.start_key) {
    if (key_press_start == 0) {
        key_press_start = current_time;
    }
    // When the key has been held longer than the short_press_limit and not yet processed...
    if (!start_key_processed && (current_time - key_press_start > short_press_limit)) {
        global.Player1_longpress = true;
        handle_start_press();
        start_key_processed = true;
    }
} else {
    // Reset the key timing and processed flag when the key is released.
    key_press_start = 0;
    start_key_processed = false;
}


// Wait for assets to load and go to Studio Screen
if (room == ROOM_000_Game_Begin && instance_exists(OBJ_Audio_Manager)) {
    room_goto(ROOM_001_Studio_Screen);
}

// For auto transitioning the Studio screen after 1000ms
if (room == ROOM_001_Studio_Screen) {
	if ((current_time - room_start_time) > 1000) {
        room_goto(ROOM_002_Intro_Video);
		
	}
}

// For juser presses longer than 100ms, to ensure no accidental keypresses and command overlap
function handle_start_press() {
	// Go to Intro Video from Studio Screen
    if (room == ROOM_001_Studio_Screen) {
        room_goto(ROOM_002_Intro_Video);
    }
	// Go to Title Screen from Intro Video
    if (room == ROOM_002_Intro_Video
        || room == ROOM_003_Intro_Video_1
        || room == ROOM_004_Intro_Video_2
        || room == ROOM_005_Intro_Video_3) {
        room_goto(ROOM_006_Title_Screen);
    }
	// Go to game room from Title Screen
    if (room == ROOM_006_Title_Screen) {
		// Play start sound
		if (!audio_is_playing(SND_PKMN_384_Rayquaza_Start_Sound)) {
			// Play sound
			audio_play_sound(SND_PKMN_384_Rayquaza_Start_Sound, 8, false);
			// Volume (5%)
			audio_sound_gain(SND_PKMN_384_Rayquaza_Start_Sound, .05, 0);
		}
		// Wait for sound to finish before transitioning rooms
		if (alarm[0] < 0) {
			alarm[0] = 100;
		}
    }
}
