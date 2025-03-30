function Script_Handle_Movement(next_move){
	show_debug_message("#### --- Handling Movement --- ####");

	var next_X_move = next_move[0];
	var next_Y_move = next_move[1];
		
	switch (current_key) {
		case 0:    // Right
			face = RIGHT;
			break;
		case 1:    // Left
			face = LEFT;
			break;
		case 2:    // Up
			face = UP;
			break;
		case 3:    // Down
			face = DOWN;
			break;
		default:
			break;
	}
	// Update sprite
	sprite_index = sprite[face];
	
	x = next_X_move; 
	y = next_Y_move;
	image_index ++; 
	show_debug_message("Moved to: (" + string(x) + ", " + string(y) + ") with frame: " + string(global.frame_count));
	currX = x;
	currY = y;	
}