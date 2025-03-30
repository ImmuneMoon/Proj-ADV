// --- Update Dialog State ---
var curr_message;
// Only process dialog logic if visible
if (global.display_text_box == true) {
	// Have the player stand still until the dialogue box is closed
	global.direction_keypress = false;

    // Set the new dialogue
	curr_message = global.current_dialogue;
    // Ensure the dialogue list is populated
    if (string_length(curr_message) > 60) {
        var dialog = "";
        var cut_dialog = "";

        for (var i = 1; i <= string_length(curr_message); i++) {
            dialog += string_copy(curr_message, i, 1);

            if (i % 60 == 0 || i == string_length(curr_message)) {
                ds_list_add(global.dialogue_list, dialog);
                dialog = "";
            }
        }
    } 
	else {
        ds_list_add(global.dialogue_list, curr_message);
    }

    // Use the current dialogue text
    if (current_dialogue_index < ds_list_size(global.dialogue_list)) {
        message = global.dialogue_list[| current_dialogue_index];
        dialogue_update = true;

        // Progressively reveal text if not fully displayed
        if (!fully_displayed) {
            text_prog += text_speed;

            // Check if the full (current) message is now displayed
            if (text_prog >= string_length(message)) {
                text_prog = string_length(message);
                fully_displayed = true;
            } else {
                fully_displayed = false;
            }
        }

        // Allow the player to advance to the next portion when fully displayed
        if (fully_displayed && keyboard_check_pressed(vk_pagedown)) {
            // Move to the next portion of dialogue
            current_dialogue_index++;
            text_prog = 0;
            fully_displayed = false;
        }
			    
		// Allow the player to dismiss the dialogue when fully displayed
		if (fully_displayed && (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space))) {    
			// Clear the dialogue list for the new interaction
		    if (!ds_list_empty(global.dialogue_list)) {
		        ds_list_clear(global.dialogue_list);
		    }
		    dialogue_update = false;
		    global.interacting = false;
		    global.display_text_box = false;
		    text_prog = 0;
		    fully_displayed = false;
			current_dialogue_index = 0;
		}
    }
}
