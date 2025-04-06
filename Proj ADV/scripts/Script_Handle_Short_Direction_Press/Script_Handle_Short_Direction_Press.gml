
// For direction presses under 85
function Script_Handle_Short_Direction_Press() {
    show_debug_message("#### --- Handling short press, key: " + string(current_key) + " --- ####");
	var short_press_pair = global.short_press_pair; // 0: 0-1 pair, 1: 2-3 pair]
	show_debug_message("global short press pair: " + string(short_press_pair));
	var new_press_pair;
	
	switch (short_press_pair) {
		case 0:
			show_debug_message("Current Animate Cycle: 0-1");
			image_index = 1;
			new_press_pair = 1;
			show_debug_message("Animating 0-1 Short Press, Next Cycle: 2-3");
			break;
		case 1: 
			show_debug_message("Current Animate Cycle: 2-3");
			image_index = 3;
			new_press_pair = 0;
			show_debug_message("Animating 2-3 Short Press, Next Cycle: 0-1");
			break;
		default:
			break;
	}
	
	global.short_press_pair = new_press_pair;
	show_debug_message("New Image Cycle Updated: " + string(new_press_pair));

    show_debug_message("Facing " + string(face) + ", short press animation. Image Index: " + string(image_index));
	
}