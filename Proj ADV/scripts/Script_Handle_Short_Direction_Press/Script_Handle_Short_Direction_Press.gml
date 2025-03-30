
// For direction presses under 85
function Script_Handle_Short_Direction_Press(current_key) {
	var short_press_state = global.short_press_state;
	var short_press_pair = global.short_press_pair;
    show_debug_message("[FUNCTION] Handling short press, key: " + string(current_key));
	
    switch (current_key) {
        case 0: 
			face = RIGHT; 
			break;
        case 1: 
			face = LEFT; 
			break;
        case 2: 
			face = UP; 
			break;
        case 3: 
			face = DOWN; 
			break;
        default: 
			break;
    }
	
    sprite_index = sprite[face];

    if (short_press_state == 0) {
        // First frame of the short press (foot lift)
        if (short_press_pair == 0) {
            if (image_index == 0 || image_index == 2) {
                image_index = 1;
            }
        } else {
            if (image_index == 2 || image_index == 0) {
                image_index = 3;
            }
        }
        short_press_state = 1; // Transition to the next state
		return global.short_press_state = short_press_state;
    }

    show_debug_message("Facing " + string(face) + ", short press animation. Image Index: " + string(image_index));

}