// Initialize movement variables
var currX = OBJ_NPC_Trainer_001_Mom.x;	// Mom's current x
var currY = OBJ_NPC_Trainer_001_Mom.y;	// Mom's Current y


var search_up = currY - Grid_Pixels;
var search_down = currY + Grid_Pixels;
var search_right = currX + Grid_Pixels;
var search_left = currX - Grid_Pixels;

var interacting = false;
var facing = false;

if (keyboard_check_pressed(vk_pagedown) && global.facing_NPC) {
	global.interacting = true;
}

if (place_meeting(search_right, y, OBJ_Player1) && global.interacting) {
	show_debug_message("Player Detected! - RIGHT");
	face = RIGHT;
	facing = true;

}
if (place_meeting(search_left, y, OBJ_Player1) && global.interacting) {
	show_debug_message("Player Detected! - LEFT");
	face = LEFT;
	facing = true;
}
if (place_meeting(x, search_up, OBJ_Player1) && global.interacting) {
	show_debug_message("Player Detected! - UP");
	face = UP;
	facing = true;
}

if (place_meeting(x, search_down, OBJ_Player1) && global.interacting) {	
	show_debug_message("Player Detected! - DOWN");
	face = DOWN;
	facing = true;
}

if (facing) {
	global.display_text_box = true;
	global.current_dialogue = dialogue_1;
	
}
if (!global.interacting) {
	face = LEFT;
	global.display_text_box = false;
	global.current_dialogue = "";
}
	
sprite_index = sprite[face]; 

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//if (OBJ_NPC_Trainer_001_Mom.x > 6 ) {
//}
	
//// Initilizes the next move
//var next_X_move;
//var next_Y_move;
//// Set collision to false for a new search

//// Determine movement direction based on the key
//switch (current_direction) {
//    case 0:    // Right
//		next_X_move = currX + Grid_Pixels; // For searching the next 8px to the right of the character's center for a collision
//        next_Y_move = currY; // For searching the Y point 8 px above the characters movement point on the x axis
//        face = RIGHT;
//        break;
//    case 1:    // Left
//        next_X_move = currX - Grid_Pixels;
//        next_Y_move = currY;
//        face = LEFT;
//        break;
//    case 2:    // Up
//		next_X_move = currX;
//		next_Y_move = currY - Grid_Pixels;
//        face = UP;
//        break;
//    case 3:    // Down
//		next_X_move = currX;
//		next_Y_move = currY + Grid_Pixels;
//        face = DOWN;
//        break;
//    default:
//        break;
//}
//show_debug_message("currX: " + string(currX) + ", currY: " + string(currY))
//show_debug_message("nextX: " + string(next_X_move) + ", nextY: " + string(next_Y_move))
        
//// Update sprite and frame counter.
//sprite_index = sprite[face];