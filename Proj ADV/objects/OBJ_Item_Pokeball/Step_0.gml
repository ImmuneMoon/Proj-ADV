var currX = OBJ_Item_Pokeball.x;
var currY = OBJ_Item_Pokeball.y;

var search_up = currY - Grid_Pixels;
var search_down = currY + Grid_Pixels;
var search_right = currX + Grid_Pixels;
var search_left = currX - Grid_Pixels;


if (global.facing_item == true 
&& global.A_key) {
	instance_destroy();
}

