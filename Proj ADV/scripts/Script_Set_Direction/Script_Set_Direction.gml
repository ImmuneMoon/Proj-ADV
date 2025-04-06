function Script_Set_Direction() {
	show_debug_message("#### --- Script_Set_Direction --- ####");
	if (global.right_key) {
		show_debug_message("Right Sprite Set");
		current_key = 0;
		face = RIGHT; 
	}

	if (global.left_key) {
		show_debug_message("Left Sprite Set");
		current_key = 1;
		face = LEFT;
	}
	
	if (global.up_key) {
		show_debug_message("Up Sprite Set");
		current_key = 2;
		face = UP; 
	}

	if (global.down_key) {
		show_debug_message("Down Sprite Set");
		current_key = 3; 
		face = DOWN; 
	}
	
    sprite_index = sprite[face];
	show_debug_message("Assigning Sprite");
}