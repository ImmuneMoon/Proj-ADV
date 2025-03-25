// Step event for OBJ_Player1
show_debug_message(" ###########---STEP SCRIPT ACTIVE---########### ");

// Get directional input
var right_key = global.right_key;
var left_key = global.left_key
var up_key = global.up_key;
var down_key = global.down_key;
var A_Button = global.A_key;

// Update global flag for directional input.
show_debug_message("[MAIN] direction_keypress == " + string(global.direction_keypress));



////////////////////////////////////////////////////////////////////////////////////////////////////////////


// Use keyboard_check_pressed to update current_key when a key is first pressed
// (This way, if multiple keys are pressed, the latest one overrides)
if (global.direction_keypress) {
	if (key_press_start == 0) {
		key_press_start = current_time;
	}
    key_pressed = true;
}
else {
	key_pressed = false;
	key_press_start = 0;
}

//////////////////////////////////////////////////////

if (right_key) {
    current_key = 0; 
}
if (left_key) {
    current_key = 1; 
}
if (up_key) {
    current_key = 2; 
}
if (down_key) {
    current_key = 3; 
}

if (A_Button) {
    current_key = 4; 
}

//////////////////////////////////////////////////////

// Now process movement if any directional key is pressed.
if (key_pressed) {
	
    // Update duration of current key press.
    key_press_duration = current_time - key_press_start;
	show_debug_message("key_press_duration: " + string(key_press_duration) + ", frame_count: " + string(global.frame_count));
    
    if (key_press_duration > short_press_limit) {
		global.Player1_longpress = true;
		handle_long_press(current_key, global.frame_count);
    } 
	if (key_press_duration <= short_press_limit) {
		global.Player1_longpress = false;
		handle_short_press(current_key);
	}
	if (global.interacting) {
		idle_animation();
	}
} 

else {
    // Reset states when no key is pressed.
    idle_animation();
	
}

//////////////////////////////////////////////////////

// Camera
var target = OBJ_Player1;
camera_set_view_pos(view_camera[0], target.x - camera_get_view_width(view_camera[0]) / 2, target.y - camera_get_view_height(view_camera[0]) / 2);

////////////////////////////////////////////////////////////////////////////////////////////////////////////




// For presses under 85
function handle_short_press(current_key) {
    show_debug_message("[FUNCTION] Handling short press, key: " + string(current_key));
    switch (current_key) {
        case 0: face = RIGHT; break;
        case 1: face = LEFT; break;
        case 2: face = UP; break;
        case 3: face = DOWN; break;
        default: break;
    }
    sprite_index = sprite[face];

    if (short_press_state == 0) {
        // First frame of the short press (foot lift)
        if (short_press_pair == 0) {
            if (image_index == 0 || image_index == 2) {
                image_index = 1;
            }
        } else {
            if (image_index == 2 || image_index == 0) {
                image_index = 3;
            }
        }
        short_press_state = 1; // Transition to the next state
    }

    if (key_press_start && key_press_duration < 86) {
        short_press_needed = true;
    } else {
        short_press_needed = false;
    }

    show_debug_message("Facing " + string(face) + ", short press animation. Image Index: " + string(image_index));

    return;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////

function idle_animation() {
    show_debug_message("[FUNCTION] Handling idle");
    key_pressed = false;
    key_press_duration = 0;
    isMoving = false;
    image_speed = 0;

    // Transition to idle frame only if coming from foot lift state
    if (short_press_state == 1) {
        if (short_press_pair == 0) {
            image_index = 0;
            short_press_pair = 1; // Switch to the other pair
        } else {
            image_index = 2;
            short_press_pair = 0; // Switch to the other pair
        }
        short_press_state = 0; // Reset state
    }

    show_debug_message("Idle Animation. Image Index: " + string(image_index));

    return;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////

function handle_long_press(current_key, frame_count) {
    show_debug_message("[FUNCTION] Handling long press, key: " + string(current_key) + ", frame_count: " + string(frame_count));
        
    // Initialize movement variables
    var currX = x;	// Player's current x
    var currY = y;	// Player's Current y
	
	global.prev_room_Player_X = currX;
	global.prev_room_Player_Y = currY;
	
	// Initilizes the next move
	var next_X_move;
    var next_Y_move;
	// Set collision to false for a new search
	var collision = false;
    global.frame_count++;

    // Determine movement direction based on the key
    switch (current_key) {
        case 0:    // Right
			next_X_move = currX + Grid_Pixels; // For searching the next 8px to the right of the character's center for a collision
            next_Y_move = currY; // For searching the Y point 8 px above the characters movement point on the x axis
            face = RIGHT;
            break;
        case 1:    // Left
            next_X_move = currX - Grid_Pixels;
            next_Y_move = currY;
            face = LEFT;
            break;
        case 2:    // Up
			next_X_move = currX;
			next_Y_move = currY - Grid_Pixels;
            face = UP;
            break;
        case 3:    // Down
			next_X_move = currX;
			next_Y_move = currY + Grid_Pixels;
            face = DOWN;
            break;
        default:
            break;
    }
	show_debug_message("currX: " + string(currX) + ", currY: " + string(currY))
	show_debug_message("nextX: " + string(next_X_move) + ", nextY: " + string(next_Y_move))
        
    // Update sprite and frame counter.
    sprite_index = sprite[face];
	show_debug_message("searchX: " + string(next_X_move) + ", searchY: " + string(next_Y_move));
	
	// Bead Headboard
	if (place_meeting(next_X_move, next_Y_move, OBJ_Bed_Top) && current_key == 4) {
		next_Y_move = currY;
		collision = true;
	}
	
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
				show_debug_message("Player on warp tile");
				global.on_warp_tile = true;
				//// Optionally, store a reference to the exact warp instance
				//warp_reference = instance_place(x, y, obj_Warp);
				break;
			}
		} 
		else {
			show_debug_message("Not a warp tile");
			// The player is NOT on a warp tile
			global.on_warp_tile = false;
			//warp_reference = noone;
		}
	}
	
	var NPC_count = ds_list_size(global.NPC_list);
	show_debug_message("NPC count: " + string(NPC_count));
	for (var i = 0; i < NPC_count; i++) {
	    var NPC_inst = global.NPC_list[| i];
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
		if (global.facing_NPC) {
			collision = true;
		}
	}
	
	var item_count = ds_list_size(global.item_list);
	var curr_item_inst;
	show_debug_message("item count: " + string(item_count));
	for (var i = 0; i < item_count; i++) {
	    var item_inst = global.item_list[| i];
		show_debug_message("item inst: " + string(item_inst));
		if (place_meeting(next_X_move, next_Y_move, item_inst)) {
			curr_item_inst = item_inst;
			// The item is in front of the character
			if (!global.facing_item) {
				show_debug_message("Player is facing an item");
				global.facing_item = true;
			}
			// The player pressed the 'A' key
			if (current_key == 4) {
				Script_Add_To_Inventory(item_inst, test, 1);
				ds_list_delete(global.item_list, i);
				break;
			}
		} 
		else {
			show_debug_message("Not facing an item");
			// The player is NOT on a warp tile
			global.facing_item = false;
			//warp_reference = noone;
		}
		if (global.facing_item) {
			collision = true;
		}
	}
	
//////////////////////////////////////////////////
	if (!place_meeting(next_X_move, next_Y_move, OBJ_Bed_Top) &&
	    place_meeting(next_X_move, next_Y_move, Main_Collision_OBJ)) {
		show_debug_message("Collision detected at: (X: " + string(next_X_move) + ", Y: " + string(next_Y_move) + ")");
		collision = true;
	}

	if (collision) {
		// Stop whichever direction youre moving in only when the colliding direction is the one being pressed
	    switch (current_key) { 
            case 0: // Right 
				OBJ_Player1.x = currX;
                break; 
            case 1: // Left 
				OBJ_Player1.x = currX;
                break; 
            case 2: // Up 
                OBJ_Player1.y = currY;
                break; 
            case 3: // Down 
                OBJ_Player1.y = currY;
				break;	
            default: 
				break; 
	    }
		show_debug_message("Player collided");
		if (global.frame_count % 24 == 0) {
			image_index ++;
			if (global.frame_count % 16 == 0) {
				audio_play_sound(SND_1__Wall_Thud, 10, 0, true);
				audio_sound_gain(SND_1__Wall_Thud, .75, 0);
				show_debug_message("playing wall thud");
			}
		}
	}
	
//////////////////////////////////////////////////////
	
	if (!collision && global.Player1_longpress) {
		show_debug_message("No collision")
		if (global.frame_count % 12 == 0) { 
			OBJ_Player1.x = next_X_move; 
			OBJ_Player1.y = next_Y_move;
			image_index ++; 
			show_debug_message("Moved to: (" + string(x) + ", " + string(y) + ") with frame: " + string(frame_count));
		}
	} 
	show_debug_message("[FUNCTION] End of function");
}


;