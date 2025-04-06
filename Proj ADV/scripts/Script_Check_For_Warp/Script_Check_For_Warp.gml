function Script_Check_For_Warp(){
	show_debug_message("#### --- Checking for warp tile --- ####");
	var warp_count = ds_list_size(global.warp_list);
	show_debug_message("Warp Count: " + string(warp_count));
	for (var i = 0; i < warp_count; i++) {
	    var warp_inst = global.warp_list[| i];
		show_debug_message("Warp inst: " + string(warp_inst));
		if (place_meeting(x, y, warp_inst)) {
			global.curr_warp_inst = warp_inst;
			// The player’s bounding box fully overlaps the warp tile
			if (!global.on_warp_tile) {
				// Just stepped onto a warp tile
				show_debug_message("Player on warp tile, setting true");
				global.on_warp_tile = true;
				//// Optionally, store a reference to the exact warp instance
				//warp_reference = instance_place(x, y, obj_Warp);
				break;
			}
		} 
		else {
			show_debug_message("Not on a warp tile, setting false");
			// The player is NOT on a warp tile
			global.on_warp_tile = false;
			//warp_reference = noone;
		}
	}
}