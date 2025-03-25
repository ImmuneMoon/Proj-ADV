function Script_Flashing_Text(X_pos, Y_pos, font, text_string, color){
	// Draw Text at the specified position
		var flash_timer = 0;
	for (var i = false; i != object_exists(OBJ_Start_Text_Box); i++) {

		// change this to control how fast the text flashes
		// the larger it is, the longer it takes for a single white-red flash
		var flash_period = 100;
	
		flash_timer++;
		if (flash_timer >= flash_period) {
			flash_timer = 0;
		}	
		var flash_color = flash_timer >= flash_period div 2 ? c_black : color;
		draw_set_color(flash_color);
		draw_set_font(font);
		draw_text(X_pos, Y_pos, text_string);
	}

}