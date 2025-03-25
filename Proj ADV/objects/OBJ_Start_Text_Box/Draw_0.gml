frame_count++;
if (room == ROOM_006_Title_Screen) {	
    var X_pos = 320;
    var Y_pos = 608;
    var font = FNT_Intro_Font; // Your font
    var text_string = "PRESS START";
    var color = c_ltgrey;
    
    // Only draw the text when the frame counter modulo 60 is less than 30.
    // This will blink the text (displayed for 30 frames, hidden for 30 frames)
    if (frame_count mod 65 < 50) {
        Script_Flashing_Text(X_pos, Y_pos, font, text_string, color);
    }
}


//// Draw Event of obj_press_start_text
//if (blink_timer < blink_interval) {
//    // Display text continuously for the first 5 seconds
//    is_visible = true;
//} else {
//    // Start blinking after the initial interval
//    if ((blink_timer - blink_interval) mod (blink_duration * 2) < blink_duration) {
//        is_visible = true; // Text is visible during the blink duration
//    } else {
//        is_visible = false; // Text is hidden after the blink duration
//    }
//}

//// Draw Event of obj_press_start_text
//if (is_visible) {
//    var X_pos = 320;
//    var Y_pos = 608;
//    var font = FNT_Intro_Font; // Your font asset
//    var text_string = "PRESS START";
//    var color = c_white;

//    Script_Text(X_pos, Y_pos, font, text_string, color);
//}