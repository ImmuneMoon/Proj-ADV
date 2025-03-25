/// @function draw_nine_slice(spr, border, x, y, w, h)
/// @desc Draws a 9-slice for older GMS versions (12-argument draw_sprite_part_ext).
function Script_9_Slice_Box(spr, border, target_x, target_y, target_w, target_h) {
	show_debug_message("9 slice active")
    var spr_w = sprite_get_width(spr);
    var spr_h = sprite_get_height(spr);

    var edge_src_w = spr_w - 2 * border;
    var edge_src_h = spr_h - 2 * border;

    var scale_x = (target_w - 2 * border) / edge_src_w;
    var scale_y = (target_h - 2 * border) / edge_src_h;

    // Corners (no scaling)
    draw_sprite_part_ext(spr, 0, 0, 0, border, border,
                         target_x, target_y,
                         1, 1, c_white, 1);
    draw_sprite_part_ext(spr, 0, spr_w - border, 0, border, border,
                         target_x + target_w - border, target_y,
                         1, 1, c_white, 1);
    draw_sprite_part_ext(spr, 0, 0, spr_h - border, border, border,
                         target_x, target_y + target_h - border,
                         1, 1, c_white, 1);
    draw_sprite_part_ext(spr, 0, spr_w - border, spr_h - border, border, border,
                         target_x + target_w - border, target_y + target_h - border,
                         1, 1, c_white, 1);

    // Edges (scaled in one direction)
    // Top edge
    draw_sprite_part_ext(spr, 0, border, 0, edge_src_w, border,
                         target_x + border, target_y,
                         scale_x, 1, c_white, 1);
    // Bottom edge
    draw_sprite_part_ext(spr, 0, border, spr_h - border, edge_src_w, border,
                         target_x + border, target_y + target_h - border,
                         scale_x, 1, c_white, 1);
    // Left edge
    draw_sprite_part_ext(spr, 0, 0, border, border, edge_src_h,
                         target_x, target_y + border,
                         1, scale_y, c_white, 1);
    // Right edge
    draw_sprite_part_ext(spr, 0, spr_w - border, border, border, edge_src_h,
                         target_x + target_w - border, target_y + border,
                         1, scale_y, c_white, 1);

    // Center (scaled both ways)
    draw_sprite_part_ext(spr, 0, border, border, edge_src_w, edge_src_h,
                         target_x + border, target_y + border,
                         scale_x, scale_y, c_white, 1);
}
