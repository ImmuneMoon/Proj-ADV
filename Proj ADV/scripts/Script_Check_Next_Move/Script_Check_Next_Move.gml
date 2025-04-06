function Script_Check_Next_Move() {
	show_debug_message("#### --- Searching For Next Move --- ####");

    // Determine movement direction based on the key
    switch (current_key) {
        case 0:    // Right
		show_debug_message("Right move");
			next_X_move = x + Grid_Pixels; // For searching the next 8px to the right of the character's center for a collision
            next_Y_move = y; // For searching the Y point 8 px above the characters movement point on the x axis
            break;
        case 1:    // Left
		show_debug_message("Left move");
            next_X_move = x - Grid_Pixels;
            next_Y_move = y;
            break;
        case 2:    // Up
		show_debug_message("Up move");
			next_X_move = x;
			next_Y_move = y - Grid_Pixels;
            break;
        case 3:    // Down
		show_debug_message("Down move");
			next_X_move = x;
			next_Y_move = y + Grid_Pixels;
            break;
        default:
            break;
    }
	show_debug_message("nextX: " + string(next_X_move) + ", nextY: " + string(next_Y_move));
		
}