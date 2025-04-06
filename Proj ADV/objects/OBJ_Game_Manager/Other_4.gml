show_debug_message("######## --- GAME CONTROLLER ROOM START --- ########");

room_start_time = current_time;


// Check if the current room has been visited before
var room_index = ds_list_find_index(global.ROOM_List, room);
if (room_index != -1) {
    // The room was visited already, so load saved items for this room.
    Script_Load_Room();
} 
else {
    // First time visiting this room; add it to the list.
    ds_list_add(global.ROOM_List, room);
    show_debug_message("Room " + string(room) + " added to ROOM_List for the first visit.");
}