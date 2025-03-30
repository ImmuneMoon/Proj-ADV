function Script_Handle_Collision() {
	show_debug_message("#### --- Handling Collision --- ####");
	// Stop whichever direction youre moving in only when the colliding direction is the one being pressed
	if (global.frame_count % 8 == 0) {	
		switch (current_key) { 
	        case 0: // Right 
				x = currX;
	            break; 
	        case 1: // Left 
				x = currX;
	            break; 
	        case 2: // Up 
	            y = currY;
	            break; 
	        case 3: // Down 
	            y = currY;
				break;	
	        default: 
				break; 
		}
		
		image_index ++;
		audio_play_sound(SND_1__Wall_Thud, 10, 0, true);
		audio_sound_gain(SND_1__Wall_Thud, .75, 0);
		show_debug_message("playing wall thud");
	}
	
}