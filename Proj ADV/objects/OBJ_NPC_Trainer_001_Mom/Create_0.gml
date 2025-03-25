// Add to list of NPCs in a room when created
ds_list_add(global.NPC_list, id);

Grid_Pixels = global.Grid_Pixels;

// --- Sprite and Animation Setup ---
sprite[RIGHT] = SPR_Mom_Right;  // Assign the sprite for moving right
sprite[LEFT]  = SPR_Mom_Left;   // Assign the sprite for moving left
sprite[UP]    = SPR_Mom_Up;     // Assign the sprite for moving up
sprite[DOWN]  = SPR_Mom_Down;   // Assign the sprite for moving down

// Set initial facing direction and sprite
face = DOWN;
sprite_index = sprite[face];  // Use the sprite for the current facing direction
image_index = 0;              // Start with the first frame of the sprite animation
image_speed = 0;              // Animation is manually controlled by the Step event

global.display_text_box = false;

dialogue_1 = "test message"
