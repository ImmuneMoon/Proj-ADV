// Play the correct music
show_debug_message("########### --- AUDIO MANAGER BEGIN STEP --- ########### ");
///////////////////////////////////////////////////////////////////////////////////////////////////

// Opening sequence

if (room == ROOM_002_Intro_Video) {
	Script_Set_Song_Ingame( SND_1_02__Intro_Sequence, 60, false, true );
}

if (room == ROOM_006_Title_Screen) {
	Script_Set_Song_Ingame( SND_1_03__Title_Screen, 60, false, true );
}

///////////////////////////////////////////////////////////////////////////////////////////////////

// PokeCenter/ PokeMart

if (room == ROOM_PokeCenter 
|| room == ROOM_PokeMart) {
	Script_Set_Song_Ingame( SND_1_21__PokeCenter_PokeMart, 60, false, true );
	
}

///////////////////////////////////////////////////////////////////////////////////////////////////

// Saffron City

if (room == ROOM_Player1_Apartment_Downstairs
|| room == ROOM_Player1_Apartment_Upstairs
|| room == ROOM_Saffron_City) {
	Script_Set_Song_Ingame( SND_1_15_0__Saffron_City, 60, false, true);
}
if (room == ROOM_Silphco) {
	Script_Set_Song_Ingame( SND_1_47__Silph_Co, 60, false, true);
}

///////////////////////////////////////////////////////////////////////////////////////////////////

// Route Music

var gen_route_music = SND_1_48__General_Route_Music; // General route music

// Route 7
if (room == ROOM_Celadon_City
&& OBJ_Player1.x >= 1520) {
	Script_Set_Song_Ingame(gen_route_music, 60, false, true);
}


///////////////////////////////////////////////////////////////////////////////////////////////////


// Celadon_City
if (room == ROOM_Celadon_City
&& OBJ_Player1.x < 1520) {
	Script_Set_Song_Ingame(SND_1_40__Celadon_City, 60, false, true);
}



///////////////////////////////////////////////////////////////////////////////////////////////////