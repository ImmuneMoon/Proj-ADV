show_debug_message("#### --- Game Controller --- ####")

global.right_key = false;
global.left_key  = false;
global.up_key    = false;
global.down_key  = false;
global.start_key = false;
global.select_key = false;

key_press_start = 0; // Track Enter key presses
key_pressed = false;
key_press_duration = 0;
short_press_limit = 100;
start_key_processed = false;

global.player_target = OBJ_Player1;
global.Player1_longpress = false;
global.frame_count = 0;


global.ROOM_List = ds_list_create();

global.levelData = {};


room_start_time = 0;

//global.frame_count = 0;

// PokeCenter & PokeMart Warp initializers
global.Player_go_in_PkmnCtr = false;
global.Player_prev_X_PkmnCtr = 0;
global.Player_prev_Y_PkmnCtr = 0;
global.previous_room_PkmnCtr = noone;



global.Player_prev_X_Mart = 0;
global.Player_prev_Y_Mart = 0;
global.Player_go_in_Mart = false;
global.previous_room_Mart = noone;

// Initialize warp obj list
global.warp_list = ds_list_create();

// Warp obj detection
global.on_warp_tile = false;
global.curr_warp_inst = noone;

// Player warp location info
global.prev_room_Player_X = 0;
global.prev_rooom_Player_Y = 0;


global.Grid_Pixels = 16;  // Size of each area wanted checking for object

// Initialize NPC obj list
global.NPC_list = ds_list_create();
global.dialogue_list = ds_list_create();
// NPC settings
global.curr_NPC_inst = noone;
global.facing_NPC = false;

// Text speed
global.display_text_box = false;
global.text_speed = .75;
global.current_dialogue = "";


// Inventory
global.backpack = {};
global.item_list = ds_list_create();
global.facing_item = false;

global.pokeballs = 0;
global.PlayerInventory = {};

