function Script_Set_Button_Press_Vals() {
	show_debug_message("#### --- Script_Get_Button_Press --- ####");
	if (global.direction_keypress) { 
		show_debug_message("Direction Button Pressed, valid_key_pressed setting to true");
		direction_key_pressed = true;
		valid_key_pressed = true;
		if (direction_key_press_start == 0) {
			if (global.right_key) {
				show_debug_message("Right Button Pressed");
				direction_key_press_start = current_time;
			}
			if (global.left_key) {
				show_debug_message("Left Button Pressed");
				direction_key_press_start = current_time;
			}
			if (global.up_key) {
				show_debug_message("Up Button Pressed");
				direction_key_press_start = current_time;
			}
			if (global.down_key) {
				show_debug_message("Down Button Pressed");
				direction_key_press_start = current_time;
			}
		}
	}
	else if (!global.direction_keypress) { 
		direction_key_pressed = false;
		direction_key_press_start = 0;
		Direction_press_duration = 0;
	}

	if (global.A_key) {
		show_debug_message("A Button Pressed, valid_key_pressed setting to true");
		valid_key_pressed = true;
		if (A_key_press_start == 0) {
			A_key_press_start = current_time;
			show_debug_message("A_key_press_start: " + string(A_key_press_start));
		}
	}
	else if (!global.A_key) {
		A_key_press_start = 0;
		A_press_duration = 0
	}

	// Check for Enter key press and process long press only once per press.
	if (global.start_key) {
		show_debug_message("Start Button Pressed");
		valid_key_pressed = true;
		if (start_key_press_start == 0) {
			start_key_press_start = current_time;
			show_debug_message("start_key_press_start: " + string(start_key_press_start));
		}
	}
	else if (!global.start_key) {
		start_key_press_start = 0;
		Start_key_press_duration = 0;
	}
	
	if (global.select_key) {
		show_debug_message("Select Button Pressed");
		valid_key_pressed = true;
		if (select_key_press_start == 0) {
			select_key_press_start = current_time;
			show_debug_message("select_key_press_start: " + string(select_key_press_start));
		}
	}
	if (!global.select_key) {
		select_key_press_start = 0;
		Select_key_press_duration = 0;
	}
	
	if (!global.direction_keypress
	&& !global.A_key
	&& !global.start_key
	&& !global.select_key) {
		show_debug_message("No Valid Button Pressed, valid_key_pressed setting to false");
		valid_key_pressed = false;
		
	}
}
