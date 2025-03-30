
show_debug_message("########### --- CONTROLS MANAGER CREATE --- ########### ");

global.right_key = false;
global.left_key  = false;
global.up_key    = false;
global.down_key  = false;
global.start_key = false;
global.select_key = false;

global.any_key_press_begin = 0;

short_press_limit = 100; // Limit for how long a buttion press is considered a short press

////////////////////////////////////////////////////////////////////////////////////////////////////////////

// --- Input Timing and State Variables ---//

////////////////////////////////////

// -- Start Key ---
start_key_press_start = 0; // Track Enter key presses
Start_key_press_duration = 0;


////////////////////////////////////

// -- A Key ---
A_key_press_start = 0;
A_press_duration = 0;

////////////////////////////////////

// -- Direction Keys ---
direction_key_pressed = false; // Is a key currently pressed?
direction_key_press_start = 0; // Timestamp for when the current keypress started
Direction_press_duration = 0;

///////////////

// - Short Press -
//short_press_needed = false; // Track whether a short press has been handled
global.short_press_state = 0; // 0: Idle, 1: Foot Lift
global.short_press_pair = 0; // 0: 0-1 pair, 1: 2-3 pair
global.Player1_direction_shortpress = false;

//////////////

// - Long Press -
global.Player1_direction_longpress = false;

////////////////////////////////////

