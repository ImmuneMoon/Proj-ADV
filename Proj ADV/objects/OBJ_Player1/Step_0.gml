// Step event for OBJ_Player1
show_debug_message("######## --- PLAYER1 STEP --- ########");
show_debug_message("#### --- Current room :" + string(room_get_name(room)) + " --- ####")
//////////////////////////////////////////////////////


// Camera
camera_set_view_pos(view_camera[0], x - camera_get_view_width(view_camera[0]) / 2, y - camera_get_view_height(view_camera[0]) / 2);

////////////////////////////////////////////////////////////////////////////////////////////////////////////
currX = x;
currY = y;
show_debug_message("currX: " + string(currX) + ", currY: " + string(currY));

global.prev_room_Player_X = currX;
global.prev_room_Player_Y = currY;

show_debug_message("prev_room_Player_X: " + string(global.prev_room_Player_X) + ", prev_room_Player_Y: " + string(global.prev_room_Player_Y));




// If Player is interactig w/ NPC, dont allow movement
if (global.interacting) {
	show_debug_message("Interacting with NPC, calling Script_Player_Idle_Animation()");
	Script_Player_Idle_Animation();
	show_debug_message("setting global direction_keypress to false");
	global.direction_keypress = false;
} 

else if (!global.interacting
&& global.direction_keypress) {
	show_debug_message("global direction_keypress is true, and not currently in dialogue, incrementing frame_count: " + string(frame_count));
	frame_count++;
	
	Script_Set_Direction();	
	
	// Check the current space for a warp tile
	show_debug_message("Calling Script_Check_For_Warp()");
	Script_Check_For_Warp();
	// If global on warp value is updated to true in the script
	if (global.on_warp_tile) {
		show_debug_message("global on warp is true, Player1 is on a warp tile");
		// Idle for 10ms
		if (alarm[0] < 0) {
			show_debug_message("setting alarm[0] to idle for 10ms after warp");
			alarm[0] = 10;
		}
	}
	
	if (global.Player1_direction_shortpress) {
		show_debug_message("setting direction: " + string(current_key) + ", setting shortpress_needed to true");
		show_debug_message("shortpress_needed, calling Script_Handle_Short_Direction_Press()");
		if (frame_count < 2) {
			Script_Handle_Short_Direction_Press();
			show_debug_message("First short press cycle finished");
			// Idle for 10ms
			if (alarm[0] < 0) {
				show_debug_message("setting alarm[0] to idle for 8ms");
				alarm[0] = 8;
			}
		}
	}
	
	else if (global.Player1_direction_longpress) {
		show_debug_message("global Player1_direction_longpress is true, setting direction: " + string(current_key));
		show_debug_message("global direction_longpress frame: " + string(frame_count));
		
		show_debug_message("Calling Script_Check_Next_Move()")
		Script_Check_Next_Move();
		show_debug_message("Next move at: nextX: " + string(next_X_move) + ", nextY: " + string(next_Y_move));
		
		// Check next move for collision
		show_debug_message("Checking Collision at: nextX: " + string(next_X_move) + ", nextY: " + string(next_Y_move));	
		show_debug_message("Calling Script_Check_Collision()");
		Script_Check_Collision();

		if (!collision) {
			show_debug_message("No collision")
			if (frame_count % 16 == 0) { 
				show_debug_message("frame_count % 16 = " + string(frame_count % 16) + " Calling Script_Check_Next_Move()");
				show_debug_message("Calling Script_Handle_Movement()");
				Script_Handle_Movement();
				show_debug_message("curr frame 16 = " + string(fra_16_move) + " Setting to true");
				fra_16_move = true;
			}
		}
		if (collision) {
			show_debug_message("Player collided");
			show_debug_message("Is frame_count divisible by 32 with no remainder? curr frame: " + string(frame_count));
			if (frame_count % 32 == 0) {
				show_debug_message("frame_count % 32 = " + string(frame_count % 32) + " Calling Script_Handle_Collision()");
				Script_Handle_Collision();
				show_debug_message("curr frame 32 = " + string(fra_32_collide) + " Setting to true");
				fra_32_collide = true;
			}
		}
		if (!global.Player1_Move_Complete) {
			if (fra_16_move || fra_32_collide) {
				global.Player1_Move_Complete = true;
				show_debug_message("Post movement Image index: " + string(image_index));
				show_debug_message("Movement Complete, seting global Player1_Move_Complete to true");
				show_debug_message("Player1_Move_Complete, setting frame_count to 0");
				if (fra_16_move) {
					show_debug_message("curr frame 16 = " + string(fra_16_move) + " Setting to false");
					fra_16_move = false;
				}
				else if (fra_32_collide) {
					show_debug_message("curr frame 32 = " + string(fra_32_collide) + " Setting to false");
					fra_32_collide = false;
				}
			}
		}
	}
}
else if (!global.direction_keypress) {
	show_debug_message("Global direction_keypress is false, calling Script_Player_Idle_Animation(), setting frame_count to 0");
	Script_Player_Idle_Animation();
	frame_count = 0;
}

if (global.add_to_inv) {
	var item_inst = global.facing_item;
	show_debug_message("Adding: " + string(item_inst) + "to inventory")
		
	Script_Add_To_Inventory(item_inst);
}

show_debug_message("#### --- End of Player1 logic --- ####");