
show_debug_message("#### --- CONTROLS MANAGER - ALARM 2 --- ####");
if (global.Player1_direction_shortpress == true) {
	show_debug_message("#### --- CONTROLS MANAGER - ALARM 2 - Shortpress --- ####");
	global.Player1_direction_shortpress = false;
	show_debug_message("Setting global shortpress indicator to false");
}

if (global.Player1_direction_longpress == true) {
	show_debug_message("#### --- CONTROLS MANAGER - ALARM 2 - Longpress --- ####");
	global.Player1_direction_longpress = false;
	show_debug_message("Setting global shortpress indicator to false");
}