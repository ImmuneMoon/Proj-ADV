global.right_key = keyboard_check(vk_right);
global.left_key = keyboard_check(vk_left);
global.up_key = keyboard_check(vk_up);
global.down_key = keyboard_check(vk_down);
 // Indicator for if a valid direction key is pressed
global.direction_keypress = global.right_key || global.left_key || global.up_key || global.down_key;

global.A_key = keyboard_check(vk_numpad1);
global.B_key = keyboard_check(vk_numpad2);
global.start_key = keyboard_check(vk_enter);
global.select_key = keyboard_check(vk_escape);

 // Indicator for if a valid key is pressed
global.key_pressed = global.direction_keypress || global.A_key || global.B_key || global.start_key || global.select_key;


show_debug_message("########### --- CONTROLS MANAGER STEP --- ########### ");

// Update global flag for directional input.
show_debug_message("Direction_keypress == " + string(global.direction_keypress));



////////////////////////////////////////////////////////////////////////////////////////////////////////////


// Use keyboard_check_pressed to update current_key when a key is first pressed
// (This way, if multiple keys are pressed, the latest one overrides)
if (global.key_pressed) {
	global.any_key_press_begin += 1;
	Script_Get_Button_Press();
}

if (!global.key_pressed) {
	global.any_key_press_begin = 0;
	global.curr_direction_key = -1;
	
	direction_key_pressed = false;
	direction_key_press_start = 0;
	A_key_press_start = 0;
	start_key_press_start = 0;
}


// Now process movement if any control key is pressed.
if (global.any_key_press_begin > 0) {
	
	// #### --- Start Presses --- ####
	if (start_key_press_start > 0) {
		Start_key_press_duration = current_time - start_key_press_start;
		show_debug_message("key_press_duration: " + string(Start_key_press_duration) + ", frame_count: " + string(global.frame_count));
	}
	if (start_key_press_start < 1) {
		Start_key_press_duration = 0;
	}
	
	
    if (Start_key_press_duration > short_press_limit) {
		global.key_pressed = false;
		if (alarm[0] < 0) {
			alarm[0] = 10;
		}
    } 
	
	// #### --- A button presses --- ####
	if (A_key_press_start > 0) {
		A_press_duration = current_time - A_key_press_start
		show_debug_message("key_press_duration: " + string(A_press_duration) + ", frame_count: " + string(global.frame_count));;
	}	
	
	
    if (A_press_duration > short_press_limit) {
		Script_Handle_A_Press();
		global.key_pressed = false;
    } 
	if (A_key_press_start < 1) {
		A_press_duration = 0;
	}
	
	// #### --- Direction presses --- ####
	if (direction_key_press_start > 0) {
	    Direction_press_duration = current_time - direction_key_press_start;
		show_debug_message("key_press_duration: " + string(Direction_press_duration) + ", frame_count: " + string(global.frame_count));
	}
	
	if (direction_key_pressed) {
		// Short Press
		if (Direction_press_duration <= short_press_limit) {
			// OBJ_Player1 listens for this to be true
			global.Player1_direction_shortpress = true;
		} 
	
		// Long Press
	   if (Direction_press_duration > short_press_limit) {
			// If the player is walking, short press shouldn't activate
			global.Player1_direction_shortpress = false;
			// OBJ_Player1 listens for this to be true
			global.Player1_direction_longpress = true;
	    } 
	}
	if (!direction_key_pressed) {
		Direction_press_duration = 0;
		global.Player1_direction_shortpress = false;
		global.Player1_direction_longpress = false;
	}
} 