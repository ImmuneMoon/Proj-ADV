// Check if the player is colliding with this warp object
if (global.on_warp_tile) {
	if (room == ROOM_Celadon_City 
	&& global.up_key 
	&& global.Player1_longpress) {
        // Teleport to the upstairs room
        room_goto(ROOM_Celadon_Department_Store_1F);
        OBJ_Player1.x = 448;
        OBJ_Player1.y = 528;
		alarm[0] = 100;
        show_debug_message("Warping to room:" + string(ROOM_Celadon_Department_Store_1F));
	}
	
	// Chack for a left keypress, indicating warping
	if (room = ROOM_Celadon_Department_Store_1F 
	&& global.down_key 
	&& global.Player1_longpress) {
		// Perform the warp based on the Player_go_Downstairs variable.
		// Teleport to the downstairs room
		room_goto(ROOM_Celadon_City);
		// Set the player's position after entering the new room
		OBJ_Player1.x = 736;
		OBJ_Player1.y = 328;
		alarm[0] = 100;
		show_debug_message("Warping to room:" + string(ROOM_Celadon_City));
    } 
}
