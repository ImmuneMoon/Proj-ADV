// Check if the player is colliding with this warp object (rug)
if (global.on_warp_tile) {
	// Chack for a left keypress, indicating warping
	if (room = ROOM_Player1_Apartment_Upstairs 
	&& global.down_key 
	&& global.Player1_longpress) {
		// Perform the warp based on the Player_go_Downstairs variable.
		// Teleport to the downstairs room
		room_goto(ROOM_Saffron_City);
		// Set the player's position after entering the new room
		OBJ_Player1.x = 440;
		OBJ_Player1.y = 608;
		alarm[0] = 100;
		show_debug_message("Warping to room:" + string(ROOM_Saffron_City));
    } 
	if (room == ROOM_Saffron_City 
	&& OBJ_Player1.x == 440
	&& OBJ_Player1.y == 608
	&& global.up_key 
	&& global.Player1_longpress) {
        // Teleport to the upstairs room
        room_goto(ROOM_Player1_Apartment_Upstairs);
        OBJ_Player1.x = 464;
        OBJ_Player1.y = 432;
		alarm[0] = 100;
        show_debug_message("Warping to room:" + string(ROOM_Player1_Apartment_Upstairs));
	}
}
