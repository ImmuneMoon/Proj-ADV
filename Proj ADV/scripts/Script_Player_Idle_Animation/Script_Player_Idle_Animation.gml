function Script_Player_Idle_Animation() {
    show_debug_message("#### --- Handling Idle --- ####");
	show_debug_message("global frame_count, key_pressed, direction_keypress reset");
	var short_press_pair = global.short_press_pair;
	show_debug_message("global short press pair: " + string(short_press_pair));
	var new_press_pair;
    x = OBJ_Player1.x;
	y = OBJ_Player1.y;
	if (frame_count == 0) {
		new_press_pair = short_press_pair;
	}
	else {
		switch (short_press_pair) {
		    case 0: 
				show_debug_message("Current Image cycle: 2-3, Idling to 0");
		        image_index = 0;
		        new_press_pair = 1; // Switch to the other pair
				show_debug_message("Idle, Image cycle 0-1 set");
				break;
			case 1: 
				show_debug_message("Current Image cycle: 0-1, Idling to 2");
		        image_index = 2;
		        new_press_pair = 0; // Switch to the other pair
				show_debug_message("Idle, Image cycle 2-3 set");
				break;
			default:
				break;
		}
		global.short_press_pair = new_press_pair;
		show_debug_message("New Image Cycle Assigned: " + string(new_press_pair));
	}
    show_debug_message("Idle Animation. Image Index: " + string(image_index));
	
}