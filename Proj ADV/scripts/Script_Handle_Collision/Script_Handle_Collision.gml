function Script_Handle_Collision() {
	show_debug_message("#### --- Handling Collision --- ####");
	// Stop whichever direction youre moving in only when the colliding direction is the one being pressed
	switch (current_key) { 
	    case 0: // Right 
			x = currX;
			show_debug_message("Stopping Right Press " + "Frame count: " + string(frame_count));
	        break; 
	    case 1: // Left 
			x = currX;
			show_debug_message("Stopping Left Press " + "Frame count: " + string(frame_count));
	        break; 
	    case 2: // Up 
	        y = currY;
			show_debug_message("Stopping Up Press " + "Frame count: " + string(frame_count));
	        break; 
	    case 3: // Down 
	        y = currY;
			show_debug_message("Stopping Down Press " + "Frame count: " + string(frame_count));
			break;	
	    default: 
			break; 
	}	
	image_index ++;
	show_debug_message("updating image_index: " + string(image_index));
	audio_play_sound(SND_1__Wall_Thud, 10, 0, true);
	audio_sound_gain(SND_1__Wall_Thud, .75, 0);
	show_debug_message("playing wall thud");
	show_debug_message("Setting global Player1_Move_Complete to true");
	global.Player1_Move_Complete = true;
	
}