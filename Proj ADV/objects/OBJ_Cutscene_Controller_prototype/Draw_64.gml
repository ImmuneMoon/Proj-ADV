// Draws DIRECTLY TO WINDOW, not the ROOM

// Draw Black bars
draw_sprite_ext(SPR_wPixel, 0, 0, 0, 1080, 400, 0, c_black, 1); // Draws a black bar of 1080 x 400 pixes from y0
draw_sprite_ext(SPR_wPixel, 0, 0, 680, 1080, 400, 0, c_black, 1); // Same but from y680 for bottom














a = 1; // Transparancy of black background, 1 is fully opaque

draw_sprite_ext(SPR_wPixel, 0, 0, 0, 1080, 1080, 0, c_black, 1); // Draws a single white pixel sprite across the screen and blends it with the desired color to the alpha "a"