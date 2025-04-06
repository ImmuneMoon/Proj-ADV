function Script_Handle_Movement() {
	show_debug_message("#### --- Handling Movement --- ####");
	x = next_X_move; 
	y = next_Y_move;
	image_index ++; 
	show_debug_message("Moved to: (" + string(x) + ", " + string(y) + "), Current frame: " + string(frame_count));
	//if (image_index == 0
	//|| image_index == 1) {
	//	global.short_press_pair = 0;
		
	//}
	//else {
	//	global.short_press_pair = 1;
	//}
}

	//switch (short_press_pair) {
	//	case 0:
	//		show_debug_message("Current Animate Cycle: 0-1");
	//		image_index = 1;
	//		new_press_pair = 1;
	//		show_debug_message("Animating 0-1 Short Press, Next Cycle: 2-3");
	//		break;
	//	case 1: 
	//		show_debug_message("Current Animate Cycle: 2-3");
	//		image_index = 3;
	//		new_press_pair = 0;
	//		show_debug_message("Animating 2-3 Short Press, Next Cycle: 0-1");
	//		break;
	//	default:
	//		break;
	//}