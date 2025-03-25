// Check if the player is colliding with this warp object (rug)
if (global.on_warp_tile) {
	if (room == ROOM_Silphco_2F 
	&& global.right_key 
	&& global.Player1_longpress) {
        // Teleport to the upstairs room
        room_goto(ROOM_Silphco_3F);
        OBJ_Player1.x = 696;
        OBJ_Player1.y = 336;
		OBJ_Player1.sprite_index = LEFT;
		alarm[0] = 100;
        show_debug_message("Warping to room:" + string(ROOM_Silphco_3F));
	}
	// Chack for a left keypress, indicating warping
	if (room = ROOM_Silphco_3F 
	&& global.right_key 
	&& global.Player1_longpress) {
		// Perform the warp based on the Player_go_Downstairs variable.
		// Teleport to the downstairs room
		room_goto(ROOM_Silphco_2F);
		// Set the player's position after entering the new room
		OBJ_Player1.x = 912;
		OBJ_Player1.y = 336;
		OBJ_Player1.sprite_index = LEFT;
		alarm[0] = 100;
		show_debug_message("Warping to room:" + string(ROOM_Silphco_2F));
    } 
}
