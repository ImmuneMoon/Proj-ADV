function Script_Player_Idle_Animation(currX, currY) {
    show_debug_message("#### --- Handling Idle --- ####");
    global.key_pressed = false;
	global.direction_keypress = false;
	var short_press_state = global.short_press_state;
	var short_press_pair = global.short_press_pair;
    x = currX;
	y = currY;
	
    // Transition to idle frame only if coming from foot lift state
    if (short_press_state == 1) {
        if (short_press_pair == 0) {
            image_index = 0;
            short_press_pair = 1; // Switch to the other pair
			global.short_press_pair = short_press_pair;
        } else {
            image_index = 2;
            short_press_pair = 0; // Switch to the other pair
			global.short_press_pair = short_press_pair;
        }
        short_press_state = 0; // Reset state
		global.short_press_state = short_press_state;
    }

    show_debug_message("Idle Animation. Image Index: " + string(image_index));
	
}