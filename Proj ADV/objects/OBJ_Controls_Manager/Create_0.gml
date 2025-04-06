
show_debug_message("########### --- CONTROLS MANAGER CREATE --- ########### ");

global.right_key = false;
global.left_key = false;
global.up_key = false;
global.down_key = false;
global.start_key = false;
global.select_key = false;
global.valid_key_pressed = false;

valid_key_pressed = false;

prob_a_cat_timer = 0;

short_press_limit = 125; // Limit for how long a buttion press is considered a short press

////////////////////////////////////////////////////////////////////////////////////////////////////////////

// --- Input Timing and State Variables ---//
alarm[0] = -1;
alarm[1] = -1;
alarm[2] = -1;

////////////////////////////////////

// -- Start Key ---
start_key_press_start = 0; // Track Enter key presses
Start_key_press_duration = 0;

////////////////////////////////////

// -- Select Key ---
select_key_press_start = 0; // Track esc key presses
Select_key_press_duration = 0;

////////////////////////////////////

// -- A Key ---
A_key_press_start = 0;  // Track numpad1 key presses
A_press_duration = 0;

////////////////////////////////////

// -- B Key ---
B_key_press_start = 0; // Track numpad2 key presses
B_press_duration = 0;

////////////////////////////////////

// -- Direction Keys ---
global.direction_keypress = false;
direction_key_pressed = false; // Is a key currently pressed?
direction_key_press_start = 0; // Timestamp for when the current keypress started
Direction_press_duration = 0;

///////////////

// - Short Press -
//short_press_needed = false; // Track whether a short press has been handled
global.short_press_pair = 0; // 0: 0-1 pair, 1: 2-3 pair
global.Player1_direction_shortpress = false;

//////////////

// - Long Press -
global.Player1_direction_longpress = false;
global.Player1_Move_Complete = false;

////////////////////////////////////

