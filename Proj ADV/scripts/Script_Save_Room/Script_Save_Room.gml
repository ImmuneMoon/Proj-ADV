
function Script_Save_Room() {
	show_debug_message("#### --- SAVING ROOM DATA --- ####")
    if (room == ROOM_000_Game_Begin
    || room == ROOM_001_Studio_Screen
    || room == ROOM_002_Intro_Video
    || room == ROOM_003_Intro_Video_1
    || room == ROOM_004_Intro_Video_2
    || room == ROOM_005_Intro_Video_3
    || room == ROOM_006_Title_Screen) {
        return;
    }
    
	        
	// Constructor for level data
	function levelData(_ROOM, _OBJs) constructor {
		 var NewlevelData = {
			ROOM : _ROOM,
			OBJs : _OBJs
		
		 }
		 return NewlevelData;
	}
	
    // Pull each list
	var item_list = global.item_list;
	var warp_list = global.warp_list;
	var NPC_list = global.NPC_list;
	var item_arr = Script_Auto_Sort_List(item_list)
    var warp_arr = Script_Auto_Sort_List(warp_list);
    //var ROOM_arr = Script_Auto_Sort_List(global.ROOM_List);
    var NPC_arr = Script_Auto_Sort_List(NPC_list);
    
    // Build a structure for the room’s items.
    var ROOM_OBJs = {
        ItemAmount: array_length(item_arr),
        ItemData: item_arr,
		
        WarpAmount: array_length(warp_arr),
        WarpData: warp_arr,
		
        //ROOMAmount: array_length(ROOM_arr),
        //ROOMData: ROOM_arr,
		
        NPCAmount: array_length(NPC_arr),
        NPCData: NPC_arr
    };

	
    // Correctly pass the current room and room_items structure
    var NewlevelData = new levelData(room, ROOM_OBJs);
	global.levelData = NewlevelData;
	if (is_struct(global.levelData)) {
	    show_debug_message("#### --- Room " + string(room) + " saved with " +
	        string(ROOM_OBJs.ItemAmount) + " item(s). --- ####");
	
	}
	else {
		show_debug_message("#### --- ERROR --- SAVE FAILED --- ####")
	}
	
    
}
