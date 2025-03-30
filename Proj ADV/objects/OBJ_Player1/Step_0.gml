// Step event for OBJ_Player1
show_debug_message("######## --- PLAYER1 STEP --- ########");
show_debug_message("#### --- Current room :" + string(room_get_name(room)) + " --- ####")
//////////////////////////////////////////////////////


// Camera
var target = OBJ_Player1;
camera_set_view_pos(view_camera[0], target.x - camera_get_view_width(view_camera[0]) / 2, target.y - camera_get_view_height(view_camera[0]) / 2);

////////////////////////////////////////////////////////////////////////////////////////////////////////////

show_debug_message("currX: " + string(currX) + ", currY: " + string(currY));

// If Player is interactig w/ NPC
if (global.interacting) {
	Script_Player_Idle_Animation(currX, currY);
	global.direction_keypress = false;
} 
if (!global.interacting) {
	if (global.direction_keypress) {
		global.frame_count++;
		switch (global.direction_keypress) {
			case (global.right_key):
				current_key = 0;
				break;

			case (global.left_key):
				current_key = 1;
				break;
	
			case (global.up_key):
				current_key = 2;
				break;

			case (global.down_key):
				current_key = 3; 
				break;
		
			default:
				break;
		
		}

		if (global.Player1_direction_shortpress) {
			Script_Handle_Short_Direction_Press(current_key);
		}

		if (global.Player1_direction_longpress) {
			// Check next step
			var next_move;
			next_move = Script_Next_Move();
			// Check the current space for a warp tile
			Script_Check_For_Warp(currX, currY);
			// If global on warp value is updated to true in the script
			if (global.on_warp_tile) {
				// Idle for 10ms
				if (alarm[0] < 0) {
					alarm[0] = 10;
				}
			}
			// Check next move for collision
			var P1_collision = Script_Check_Collision(next_move);
			collision = P1_collision;

			if (!collision) {
				show_debug_message("No collision")
				if (global.frame_count % 12 == 0) { 
					Script_Handle_Movement(next_move);
				}
				
			}
			if (collision) {
				show_debug_message("Player collided");
				if (global.frame_count % 32 == 0) {
					Script_Handle_Collision();
				}
			}
		}
		if (!global.Player1_direction_longpress) {
			collision = false;
		}
	}
	if (!global.direction_keypress) {
		Script_Player_Idle_Animation(currX, currY);
		global.frame_count = 0;
	}
	global.prev_room_Player_X = currX;
	global.prev_room_Player_Y = currY;
}
