function Script_Check_Collision(next_move) {
	var P1_collide = collision
	var Collision_OBJ = global.MainCollisionOBJ;
    var next_X_move = next_move[0];
	var next_Y_move = next_move[1];
	var NPC_list = global.NPC_list;
	show_debug_message("#### --- Checking for collision --- ####")
	// Bead Headboard
	if (place_meeting(next_X_move, next_Y_move, OBJ_Bed_Top) 
	&& current_key == 4
	&& !P1_collide) {
		P1_collide = true;
	}
	
	var NPC_count = ds_list_size(NPC_list);
	show_debug_message("NPC count: " + string(NPC_count));
	for (var i = 0; i < NPC_count; i++) {
	    var NPC_inst = NPC_list[| i];
		show_debug_message("NPC inst: " + string(NPC_inst));
		if (place_meeting(next_X_move, next_Y_move, NPC_inst)) {
			global.curr_NPC_inst = NPC_inst;
			// The player’s bounding box fully overlaps the warp tile
			if (!global.facing_NPC) {
				// Just stepped onto a warp tile
				show_debug_message("Player is facing NPC");
				global.facing_NPC = true;
				//// Optionally, store a reference to the exact warp instance
				//warp_reference = instance_place(x, y, obj_Warp);
				break;
			}
		} 
		else {
			show_debug_message("Not facing an NPC");
			// The player is NOT on a warp tile
			global.facing_NPC = false;
			//warp_reference = noone;
		}
		if (global.facing_NPC
		&& !P1_collide) {
			P1_collide = true;
		}
	}
	
	var item_count = ds_list_size(global.item_list);
	show_debug_message("item count: " + string(item_count));
	for (var i = 0; i < item_count; i++) {
	    var item_data = global.item_list[| i];
		var index = i;
		var curr_item_ID = item_data.ID;
		show_debug_message("item inst: " + string(curr_item_ID));
		if (place_meeting(next_X_move, next_Y_move, curr_item_ID)) {
			// The item is in front of the character
			if (!global.facing_item) {
				show_debug_message("Player is facing an item");
				global.facing_item = curr_item_ID;
			}
		} 
		else {
			show_debug_message("Not facing an item");
			// The player is NOT on a warp tile
			global.facing_item = noone;
			//warp_reference = noone;
		}
		if (global.facing_item
		&& !P1_collide) {
			P1_collide = true;
		}
	}
	
//////////////////////////////////////////////////
	if (place_meeting(next_X_move, next_Y_move, Collision_OBJ)
	&& !P1_collide) {
		show_debug_message("Collision detected at: (X: " + string(next_X_move) + ", Y: " + string(next_Y_move) + ")");
		P1_collide = true;
	}
	
	if (!global.facing_NPC
	&& !global.facing_NPC
	&& !global.facing_item
	&& !place_meeting(next_X_move, next_Y_move, OBJ_Bed_Top)
	&& !place_meeting(next_X_move, next_Y_move, Collision_OBJ)) {
		P1_collide = false;	
	}
	
	return P1_collide;
}