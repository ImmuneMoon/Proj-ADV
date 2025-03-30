function Script_Get_Button_Press(){
	switch (global.key_pressed) { 
		case (global.direction_keypress):
			if (direction_key_press_start == 0) {
				direction_key_press_start = current_time;
			}
			direction_key_pressed = true;
			break;

		case (global.A_key):
			if (A_key_press_start == 0) {
				A_key_press_start = current_time;
			}
			break;

		// Check for Enter key press and process long press only once per press.
		case (global.start_key):
			if (start_key_press_start == 0) {
			    start_key_press_start = current_time;
			}
			break;
		case (global.select_key):
			if (select_key_press_start == 0) {
			    select_key_press_start = current_time;
			}
			break;
		default:
			break;
	}
		
}
