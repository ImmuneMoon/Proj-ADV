
show_debug_message("########### --- CONTROLS MANAGER STEP --- ########### ");

global.right_key = keyboard_check(vk_right);
show_debug_message("global.right_key: " + string(global.right_key));
global.left_key = keyboard_check(vk_left);
show_debug_message("global.left_key: " + string(global.left_key));
global.up_key = keyboard_check(vk_up);
show_debug_message("global.up_key: " + string(global.up_key));
global.down_key = keyboard_check(vk_down);
show_debug_message("global.down_key: " + string(global.down_key));
 // Indicator for if a valid direction key is pressed
global.direction_keypress = global.right_key || global.left_key || global.up_key || global.down_key;
show_debug_message("global.direction_keypress: " + string(global.direction_keypress));

global.A_key = keyboard_check(vk_pageup);
show_debug_message("global.A_key: " + string(global.A_key));
global.B_key = keyboard_check(vk_pagedown);
show_debug_message("global.B_key: " + string(global.B_key));
global.start_key = keyboard_check(vk_enter);
show_debug_message("global.start_key: " + string(global.start_key));
global.select_key = keyboard_check(vk_escape);
show_debug_message("global.select_key: " + string(global.select_key));

 // Indicator for if a valid key is pressed
global.valid_key_pressed = global.direction_keypress || global.A_key || global.B_key || global.start_key || global.select_key;
show_debug_message("global.valid_key_pressed: " + string(global.valid_key_pressed));


////////////////////////////////////////////////////////////////////////////////////////////////////////////



show_debug_message("Calling Script_Set_Button_Press_Vals()");
Script_Set_Button_Press_Vals();

if (!global.valid_key_pressed) {
	show_debug_message("#### --- GLOBAL VALID KEY NOT PRESSED --- ####");
	valid_key_pressed = false;
}

if (keyboard_check(vk_anykey) && !valid_key_pressed) {
	show_debug_message("#### --- LOCAL VALID KEY NOT PRESSED --- ####");
	prob_a_cat_timer++;
	show_debug_message("Probably a cat %: " + string(prob_a_cat_timer / 25));
	if (prob_a_cat_timer > 2500 && prob_a_cat_timer < 3500) {
		show_debug_message("ᓚᘏᗢ <(meow)");
	}
}
else {
	show_debug_message("No invalid key pressed");
	prob_a_cat_timer = 0;
}

// Now process movement if any control key is pressed.
if (valid_key_pressed) {
	show_debug_message("#### --- LOCAL VALID KEY PRESSED --- ####");

	if (start_key_press_start > 0) {
		show_debug_message("### --- START KEY --- ###");
		show_debug_message("start_key_press_start = " + string(start_key_press_start))
		Start_key_press_duration = current_time - start_key_press_start;
		show_debug_message("start_key_press_duration: " + string(Start_key_press_duration) + ", global frame_count: " + string(global.frame_count));
		
		if (Start_key_press_duration > short_press_limit) {
			show_debug_message("### --- START KEY, ACTING --- ###");
			if (alarm[0] < 0) {
				show_debug_message("Setting Alarm[0]")
				alarm[0] = 10;
			}
		} 
	}
	
	
	// #### --- Select Presses --- ####
	if (select_key_press_start > 0) {
		show_debug_message("### --- SELECT KEY --- ###");
		show_debug_message("select_key_press_start = " + string(select_key_press_start));
		Select_key_press_duration = current_time - select_key_press_start;
		show_debug_message("select_key_press_duration: " + string(Select_key_press_duration) + ", global frame_count: " + string(global.frame_count));
			
		if (Select_key_press_duration > short_press_limit) {
			show_debug_message("### --- SELECT KEY, ACTING --- ###");
			if (alarm[0] < 0) {
				show_debug_message("Setting Alarm[0]")
				alarm[0] = 10;
			}
		} 
	}
	
	
	// #### --- A button presses --- ####
	
	if (A_key_press_start > 0) {
		show_debug_message("### --- 'A' KEY --- ###");
		A_press_duration = current_time - A_key_press_start
		show_debug_message("A_key_press_duration: " + string(A_press_duration) + ", global frame_count: " + string(global.frame_count));
			
		if (A_press_duration > short_press_limit) {
			show_debug_message("### --- 'A' KEY, ACTING --- ###");
			Script_Handle_A_Press();
			if (global.A_key) {
				global.A_key = false;
			}
		} 
	}	
	
	
	// #### --- B button presses --- ####
	
	if (B_key_press_start > 0) {
		show_debug_message("### --- 'A' KEY --- ###");
		B_key_press_start = current_time - B_key_press_start
		show_debug_message("A_key_press_duration: " + string(B_key_press_start) + ", global frame_count: " + string(global.frame_count));
			
		if (B_press_duration > short_press_limit) {
			show_debug_message("### --- 'A' KEY, ACTING --- ###");
			Script_Handle_A_Press();
			if (global.B_key) {
				global.B_key = false;
			}
		} 
	}	
	
	
	// #### --- Direction presses --- ####

	if (direction_key_pressed) {
		if (global.Player1_Move_Complete) {
			direction_key_press_start = current_time;
		}
		show_debug_message("Short press cycle needed");
		show_debug_message("### --- DIRECTION KEY --- ###");
		if (direction_key_press_start > 0) {
			if (global.Player1_Move_Complete) {
				global.Player1_Move_Complete = false
			}
			show_debug_message("### --- DIRECTION KEY TIMER BEGINNING --- ###");
		    Direction_press_duration = current_time - direction_key_press_start;
			show_debug_message("direction_key_press_duration: " + string(Direction_press_duration) + ", global frame_count: " + string(global.frame_count));
		}
		// Short Press
		if (Direction_press_duration <= short_press_limit) {
			show_debug_message("### --- DIRECTION KEY - SHORT PRESS ACTING --- ###");
			// OBJ_Player1 listens for this to be true
			global.Player1_direction_shortpress = true;
			global.Player1_direction_longpress = false;
		} 
		// Long Press
	   else if (Direction_press_duration > short_press_limit) {
			show_debug_message("### --- DIRECTION KEY - LONG PRESS ACTING --- ###");
			// If the player is walking, short press shouldn't activate
			// OBJ_Player1 listens for this to be true
			global.Player1_direction_shortpress = false;
			global.Player1_direction_longpress = true;
	    }
	}
	else if (!direction_key_pressed) {
		show_debug_message("### --- LOCAL DIRECTION KEY - FALSE --- ###");
		show_debug_message("Setting global direction press types to false");
		global.Player1_direction_shortpress = false;
		global.Player1_direction_longpress = false;
	}	
} 