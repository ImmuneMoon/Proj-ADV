// Warp logic for teleporting player to new room or position
if (global.Player_go_in_PkmnCtr == true
&& OBJ_Player1.x == global.Player_prev_X_PkmnCtr
&& OBJ_Player1.y == global.Player_prev_Y_PkmnCtr
&& global.up_key
&& global.Player1_longpress) {
		room_goto(ROOM_PokeCenter);
		OBJ_Player1.x = 528;
		OBJ_Player1.y = 432;
		show_debug_message("Warping to room:" + string(ROOM_PokeCenter));
}
if (global.Player_go_in_PkmnCtr == false
&& OBJ_Player1.x == 528
&& OBJ_Player1.y == 432
&& global.down_key
&& global.Player1_longpress) {
	room_goto(global.previous_room_PkmnCtr);
	OBJ_Player1.x = global.Player_prev_X_PkmnCtr;
	OBJ_Player1.y = global.Player_prev_Y_PkmnCtr;
	show_debug_message("Warping to room:" + string(global.previous_room_PkmnCtr));
}