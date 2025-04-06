function Script_Check_Collision() {
	show_debug_message("#### --- Checking for collision --- ####");
	var P1_collide = collision
	var Collision_OBJ = global.MainCollisionOBJ;
	var NPC_list = global.NPC_list;
	// Bead Headboard
	if (place_meeting(next_X_move, next_Y_move, OBJ_Bed_Top) 
	&& (global.up_key || global.down_key)
	&& !P1_collide) {
		show_debug_message("Player is facing the bed top, setting P1_collide to true");
		P1_collide = true;
	}
	
	show_debug_message("### --- Checking for NPCs --- ###");
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
				show_debug_message("Player is facing NPC setting global.facing_NPC to true");
				global.facing_NPC = true;
				//// Optionally, store a reference to the exact warp instance
				//warp_reference = instance_place(x, y, obj_Warp);
				break;
			}
		} 
		else {
			show_debug_message("Not facing an NPC, setting global.facing_NPC to false");
			// The player is NOT on a warp tile
			global.facing_NPC = false;
			//warp_reference = noone;
		}
		if (global.facing_NPC
		&& !P1_collide) {
			show_debug_message("Player is facing NPC, setting P1_collide to true");
			P1_collide = true;
		}
	}
	
	show_debug_message("### --- Checking for Items --- ###");
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
				show_debug_message("Player is facing an item, setting global.facing_item to the current item");
				global.facing_item = item_data;
			}
		} 
		else {
			show_debug_message("Not facing an item, setting global.facing_item to false");
			// The player is NOT on a warp tile
			global.facing_item = noone;
			//warp_reference = noone;
		}
		if (global.facing_item
		&& !P1_collide) {
			show_debug_message("Player is facing an item, setting P1_collide to true");
			P1_collide = true;
		}
	}
	
//////////////////////////////////////////////////
	show_debug_message("### --- Checking for Collision_OBJs --- ###");
	if (place_meeting(next_X_move, next_Y_move, Collision_OBJ)
	&& !P1_collide) {
		show_debug_message("Main OBJ collision detected at: (X: " + string(next_X_move) + ", Y: " + string(next_Y_move) + ")");
		P1_collide = true;
	}
	
	if (!global.facing_NPC
	&& !global.facing_NPC
	&& !global.facing_item
	&& !place_meeting(next_X_move, next_Y_move, OBJ_Bed_Top)
	&& !place_meeting(next_X_move, next_Y_move, Collision_OBJ)) {
		show_debug_message("No collisions detected, setting P1_collide to false");
		P1_collide = false;	
	}
	
	show_debug_message("Updating collision from P1_collide");
	collision = P1_collide;
}