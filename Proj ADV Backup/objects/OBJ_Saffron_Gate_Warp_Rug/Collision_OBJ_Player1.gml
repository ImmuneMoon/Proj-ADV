// Check if the player is colliding with this warp object (rug)
if (global.on_warp_tile) {
	// Chack for a left keypress, indicating warping
	if (room = ROOM_Saffron_City 
	&& global.left_key 
	&& global.Player1_longpress) {
		// Perform the warp based on the Player_go_Downstairs variable.
		// Teleport to the downstairs room
		room_goto(ROOM_Saffron_Celadon_Gate);
		// Set the player's position after entering the new room
		OBJ_Player1.x = 592;
		OBJ_Player1.y = 384;
		alarm[0] = 100;
		show_debug_message("Warping to room:" + string(ROOM_Saffron_Celadon_Gate));
    } 
	if (room == ROOM_Saffron_Celadon_Gate 
	&& global.right_key 
	&& global.Player1_longpress) {
        // Teleport to the upstairs room
        room_goto(ROOM_Saffron_City);
        OBJ_Player1.x = 120;
        OBJ_Player1.y = 416;
		alarm[0] = 100;
        show_debug_message("Warping to room:" + string(ROOM_Saffron_City));
	}
}
