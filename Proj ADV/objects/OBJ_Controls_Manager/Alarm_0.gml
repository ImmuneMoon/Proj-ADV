
show_debug_message("#### --- CONTROLS MANAGER - ALARM 0 --- ####");

show_debug_message("Setting global start key listener to false");
if (global.start_key) {
	global.start_key = false;
}
show_debug_message("### --- Calling Script_Handle_Start_Press() --- ###");
Script_Handle_Start_Press();
