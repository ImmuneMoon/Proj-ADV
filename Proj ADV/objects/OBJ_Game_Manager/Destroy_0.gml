show_debug_message("#### --- GAME CONTROLLER DESTROY --- ####");
show_debug_message("Cleaning up ds_lists");
// Destroy any lists when not needed
ds_list_destroy(global.ROOM_List);
ds_list_destroy(global.warp_list);
ds_list_destroy(global.NPC_list);
ds_list_destroy(global.dialogue_list);
ds_list_destroy(global.item_list);
