// --- Initialization ---
dialogue_update = false; 
current_dialogue_index = 0;

// The full text to display in the dialog
message = "";
global.current_dialogue = "";
new_2_line = "";

// Current progress in displaying the text
text_prog = 0;

// Speed at which text appears (characters per step)
text_speed = 0.5;

// Flag to indicate if the full message has been displayed
fully_displayed = false;

// Position and size of the dialog box

dialog_x = 0;
dialog_y = 835;
dialog_width = Resolution_Width;
dialog_height = Resolution_Height / 1;

// Padding inside the dialog box for text
text_padding = 40;

// Font and color settings
font = FNT_001_FireRed_LeafGreen; // Replace with your font asset
text_color = c_black;

// Background color of the dialog box
dialog_bg_color = c_black;

// Border color and size
border_color = c_white;
border_size = 2;

global.interacting = false;