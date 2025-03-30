
show_debug_message("########### --- GAME CONTROLLER STEP --- ###########");


show_debug_message("NPC_list: " + string(global.NPC_list));
show_debug_message("dialogue_list: " + string(global.dialogue_list));
show_debug_message("warp_list: " + string(global.warp_list));


// Wait for assets to load and go to Studio Screen
if (room == ROOM_000_Game_Begin && instance_exists(OBJ_Audio_Manager)) {
    room_goto(ROOM_001_Studio_Screen);
}

// For auto transitioning the Studio screen after 1000ms
if (room == ROOM_001_Studio_Screen) {
	if ((current_time - room_start_time) > 1000) {
        room_goto(ROOM_002_Intro_Video);
	}
}


