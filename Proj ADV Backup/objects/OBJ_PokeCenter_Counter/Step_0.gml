// Initialize movement variables
var currX = OBJ_PokeCenter_Counter.x;	// Mom's current x
var currY = OBJ_PokeCenter_Counter.y;	// Mom's Current y
var search_down = currY + global.Grid_Pixels;

if (keyboard_check_pressed(vk_pagedown) && global.facing_NPC) {
	global.interacting = true;
}

if (place_meeting(x, search_down, OBJ_Player1) && global.interacting) {	
	show_debug_message("Player Detected! - DOWN");
	global.current_dialogue = dialogue;
	global.display_text_box = true;
}