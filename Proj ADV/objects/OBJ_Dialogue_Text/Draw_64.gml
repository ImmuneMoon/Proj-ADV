
    //// Draw the dialog box background using 9-sliced image

    //var corner_size = 0; // Adjust based on the size of the corners in your sprite
	//draw_sprite_ext(SPR_Dialogue_Frames, 0, dialog_x, dialog_y, dialog_width, 4, 0, c_white, 1);

    ////// Draw the border (optional, if needed separately)
    ////draw_set_color(border_color);
    ////for (var i = 0; i < border_size; i++) {
    ////    draw_rectangle(dialog_x - i, dialog_y - i, dialog_x + dialog_width + i, dialog_y + dialog_height + i, false);
    ////}
	
if (dialogue_update) {
    draw_sprite(SPR_Dialog_Frame, 0, dialog_x, dialog_y);

    // Set font and color for text
    draw_set_font(FNT_001_FireRed_LeafGreen);
    draw_set_color(c_black);

    // Determine the portion of the message to display
    var displayed_text = string_copy(message, 1, text_prog);

    // Calculate text position with padding
    var text_x = dialog_x + text_padding + 40;
    var text_y = dialog_y + text_padding;

    // Draw the text
    draw_text(text_x, text_y, displayed_text);
}
