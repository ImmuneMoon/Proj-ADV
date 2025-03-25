/// Create Event for OBJ_Player1

Grid_Pixels = global.Grid_Pixels;  // Size of each area wanted checking for object

// --- Object Groups for Collisions ---

Main_Collision_OBJ = OBJ_Silph_co_Tower;

// --- Sprite and Animation Setup ---
sprite[RIGHT] = SPR_Player_Right;  // Assign the sprite for moving right
sprite[LEFT]  = SPR_Player_Left;   // Assign the sprite for moving left
sprite[UP]    = SPR_Player_Up;     // Assign the sprite for moving up
sprite[DOWN]  = SPR_Player_Down;   // Assign the sprite for moving down

// Set initial facing direction and sprite
face = DOWN;
sprite_index = sprite[face];  // Use the sprite for the current facing direction
image_index = 0;              // Start with the first frame of the sprite animation
image_speed = 0;              // Animation is manually controlled by the Step event

////////////////////////////////////////////////////////////////////////////////////////////////////////////

// --- Animation Frame Tracking ---

////////////////////////////////////////////////////////////////////////////////////////////////////////////

// --- Input Timing and State Variables ---// In the Create Event of OBJ_Player1
short_press_state = 0; // 0: Idle, 1: Foot Lift
short_press_pair = 0; // 0: 0-1 pair, 1: 2-3 pair
short_press_limit = 75;  // The time a keypress can be active and considered a short press
key_pressed = false;         // Is a key currently pressed?
key_press_start = 0;         // Timestamp for when the current keypress started
key_press_duration = 0;      // Duration of the key press
key_press_time = 0;          // Additional timing variable (optional)
short_press_needed = false;  // Track whether a short press has been handled
current_key = -1;

////////////////////////////////////////////////////////////////////////////////////////////////////////////