function Script_Next_Move() {
	show_debug_message("#### --- Searching For Next Move --- ####");
	
	global.prev_room_Player_X = currX;
	global.prev_room_Player_Y = currY;
	
	// Initilizes the next move
	var next_X_move;
    var next_Y_move;
	var next_move = [];
	// Set collision to false for a new search

    // Determine movement direction based on the key
    switch (current_key) {
        case 0:    // Right
			next_X_move = currX + Grid_Pixels; // For searching the next 8px to the right of the character's center for a collision
            next_Y_move = currY; // For searching the Y point 8 px above the characters movement point on the x axis
            break;
        case 1:    // Left
            next_X_move = currX - Grid_Pixels;
            next_Y_move = currY;
            break;
        case 2:    // Up
			next_X_move = currX;
			next_Y_move = currY - Grid_Pixels;
            break;
        case 3:    // Down
			next_X_move = currX;
			next_Y_move = currY + Grid_Pixels;
            break;
        default:
            break;
    }
	show_debug_message("nextX: " + string(next_X_move) + ", nextY: " + string(next_Y_move))
	

	array_push(next_move, next_X_move, next_Y_move);
	return next_move;
}