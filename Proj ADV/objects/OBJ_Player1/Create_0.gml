show_debug_message("######## --- PLAYER1 CREATE --- ########");

global.PlayerCharacter = id;

Grid_Pixels = global.Grid_Pixels;  // 16px
// Initialize movement variables
currX = x;	// Player's current x
currY = y;	// Player's Current y

current_key = -1

// --- Sprite and Animation Setup ---
sprite[RIGHT] = SPR_Player_Right;  // Assign the sprite for moving right
sprite[LEFT]  = SPR_Player_Left;   // Assign the sprite for moving left
sprite[UP]    = SPR_Player_Up;     // Assign the sprite for moving up
sprite[DOWN]  = SPR_Player_Down;   // Assign the sprite for moving down

// Set initial facing direction and sprite
face = DOWN;
sprite_index = sprite[face];  // Use the sprite for the current facing direction
image_index = 0;              // Start with the first frame of the sprite animation
image_speed = 0;   

_items_arr = [];
_key_items_arr = [];
_pokeballs_arr = [];

collision = false;

global.inventory = {

    ITEMS : _items_arr,
    KEY_ITEMS : _key_items_arr,
    POKe_BALLS : _pokeballs_arr

};