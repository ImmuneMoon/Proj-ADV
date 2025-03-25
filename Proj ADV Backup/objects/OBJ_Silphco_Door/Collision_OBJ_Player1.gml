// Check if the player is colliding with this warp object
if (global.on_warp_tile) {
	if (room == ROOM_Saffron_City 
	&& global.up_key 
	&& global.Player1_longpress) {
        // Teleport to the upstairs room
        room_goto(ROOM_Silphco);
        OBJ_Player1.x = 544;
        OBJ_Player1.y = 624;
		alarm[0] = 100;
        show_debug_message("Warping to room:" + string(ROOM_Silphco));
	}
	
	// Chack for a left keypress, indicating warping
	if (room = ROOM_Silphco 
	&& global.down_key 
	&& global.Player1_longpress) {
		// Perform the warp based on the Player_go_Downstairs variable.
		// Teleport to the downstairs room
		room_goto(ROOM_Saffron_City);
		// Set the player's position after entering the new room
		OBJ_Player1.x = 520;
		OBJ_Player1.y = 480;
		alarm[0] = 100;
		show_debug_message("Warping to room:" + string(ROOM_Saffron_City));
    } 
}
