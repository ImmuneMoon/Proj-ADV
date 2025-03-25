// Add to list of NPCs in a room when created
ds_list_add(global.NPC_list, id);

Grid_Pixels = 16;  // Size of each area wanted checking for object

// --- Sprite and Animation Setup ---
sprite[DOWN] = OBJ_Nurse_Joy.sprite_index[0];  // Assign the sprite for moving right
sprite[UP]  = OBJ_Nurse_Joy.sprite_index[1];   // Assign the sprite for moving left
sprite[LEFT] = OBJ_Nurse_Joy.sprite_index[2];     // Assign the sprite for moving up
sprite[RIGHT]  = OBJ_Nurse_Joy.sprite_index[3];   // Assign the sprite for moving down

// Set initial facing direction and sprite
face = DOWN;
sprite_index = sprite[face];  // Use the sprite for the current facing direction
image_index = 0;              // Start with the first frame of the sprite animation
image_speed = 0;              // Animation is manually controlled by the Step event

global.display_text_box = false;


