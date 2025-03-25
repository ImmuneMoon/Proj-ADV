// Initialize movement variables
var currX = OBJ_Nurse_Joy.x;	// Mom's current x
var currY = OBJ_Nurse_Joy.y;	// Mom's Current y

var search_up = currY - Grid_Pixels;
var search_down = currY + Grid_Pixels;
var search_right = currX + Grid_Pixels;
var search_left = currX - Grid_Pixels;

var interacting = false;
var facing = false;

//if (keyboard_check_pressed(vk_pagedown) && global.facing_NPC) {
//	global.interacting = true;
//}

//if (place_meeting(search_right, y, OBJ_Player1) && global.interacting) {
//	show_debug_message("Player Detected! - RIGHT");
//	face = RIGHT;
//	facing = true;

//}
//if (place_meeting(search_left, y, OBJ_Player1) && global.interacting) {
//	show_debug_message("Player Detected! - LEFT");
//	face = LEFT;
//	facing = true;
//}
//if (place_meeting(x, search_up, OBJ_Player1) && global.interacting) {
//	show_debug_message("Player Detected! - UP");
//	face = UP;
//	facing = true;
//}

//if (place_meeting(x, search_down, OBJ_Player1) && global.interacting) {	
//	show_debug_message("Player Detected! - DOWN");
//	face = DOWN;
//	facing = true;
//}

//if (facing) {
//	global.display_text_box = true;
//	global.current_dialogue = dialogue_1;
	
//}
//if (!global.interacting) {
//	face = LEFT;
//	global.display_text_box = false;
//	global.current_dialogue = "";
//}
	
//sprite_index = sprite[face]; 

	
	
	
	
	
	
	
	
	