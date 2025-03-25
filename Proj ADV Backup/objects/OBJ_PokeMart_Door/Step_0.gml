// Warp logic for teleporting player to new room or position
if (global.Player_go_in_Mart == true
&& OBJ_Player1.x == global.Player_prev_X_Mart
&& OBJ_Player1.y == global.Player_prev_Y_Mart
&& global.up_key
&& global.Player1_longpress) {
		room_goto(ROOM_PokeMart);
		OBJ_Player1.x = 480;
		OBJ_Player1.y = 416;
		show_debug_message("Warping to PokeMart:" + string(ROOM_PokeMart));
}
else if (global.Player_go_in_Mart == false
&& global.Player1_longpress
&& OBJ_Player1.x == 480
&& OBJ_Player1.y == 416
&& global.down_key) {
	room_goto(global.previous_room_Mart);
	OBJ_Player1.x = global.Player_prev_X_Mart;
	OBJ_Player1.y = global.Player_prev_Y_Mart;
	show_debug_message("Warping to Previous PokeMart Entrance:" + string(global.previous_room_Mart));
}