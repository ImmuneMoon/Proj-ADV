function Script_Auto_Sort_List(GlobalList){
    // Save the state of the room you're leaving
    var count = ds_list_size(GlobalList);
    var OBJs_array = [];
    var inst;
    
    // Loop through each item in the global item list.
    for (var i = 0; i < count; i++) {
        // Ensure the instance exists before processing it
        inst = GlobalList[| i];
        if (instance_exists(inst)) {
            var OBJ_entry = {
                objX: inst.x,
                objY: inst.y,
                obj: inst, // save the object index instead of the instance itself
                unique_id: i // if needed
            };
            array_push(OBJs_array, OBJ_entry);
        }
    }
	return OBJs_array;
}

function Script_Save_Backpack() {
    if (room == ROOM_000_Game_Begin
    || room == ROOM_001_Studio_Screen
    || room == ROOM_002_Intro_Video
    || room == ROOM_003_Intro_Video_1
    || room == ROOM_004_Intro_Video_2
    || room == ROOM_005_Intro_Video_3
    || room == ROOM_006_Title_Screen) {
        return;
    }
	
	//global.backpack = new 
}


function Script_Save_Room() {
    if (room == ROOM_000_Game_Begin
    || room == ROOM_001_Studio_Screen
    || room == ROOM_002_Intro_Video
    || room == ROOM_003_Intro_Video_1
    || room == ROOM_004_Intro_Video_2
    || room == ROOM_005_Intro_Video_3
    || room == ROOM_006_Title_Screen) {
        return;
    }
    
    // Pull each list
	var item_arr = Script_Auto_Sort_List(global.item_list)
    var warp_arr = Script_Auto_Sort_List(global.warp_list);
    //var ROOM_arr = Script_Auto_Sort_List(global.ROOM_List);
    var NPC_arr = Script_Auto_Sort_List(global.NPC_list);
    
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
        
	// Constructor for level data
	function levelData(_ROOM, _OBJs) constructor {
	    ROOM = _ROOM;
	    OBJs = _OBJs;
	}
	
    // Correctly pass the current room and room_items structure
    global.levelData = new levelData(room, ROOM_OBJs);
    
    show_debug_message("Room " + string(room) + " saved with " +
        string(ROOM_OBJs.ItemAmount) + " item(s).");
}


function Script_Compare_Longer_List(SAVEList, SAVELength, GlobalList, GlobalLength, Remove) {
	
	// Converts the global ds_list to an array
	var GlobalList_arr = [];
	for (var g = 0; g < GlobalLength; g++) {
		array_push(GlobalList_arr, GlobalList[| g]);
	}
	// Initialize list comparison arguments
	var arg1, arg2, arg3, arg4;
	// Assign comparison based on
	switch (Remove) {
		// If the global list is longer than the save list
		case true:
			// Comparison 1
			arg1 = SAVEList;
			arg2 = SAVELength;
			
			// Comparison 2
			arg3 = GlobalList;
			arg4 = GlobalLength;
			break;
		// If the save list is longer than the global list
		case false:
			// Comparison 1
			arg1 = GlobalList;
			arg2 = GlobalLength;
			
			// Comparison 2
			arg3 = SAVEList;
			arg4 = SAVELength;
			break;
		default:
			break;
			
	}
	// Initialize array to hold items that arent in the other list
	var longer_items_arr = [];
	// Initialize 
	var position_arr = [];
	// Check each item in list1 against every item in list2
	for (var i = 0; i < arg2; i++) { // Comparison 1
		for (var n = 0; n < arg4; n++) { // Comparison 2
			if (n >= arg4 && arg3[n] != arg1[i]) {
				// Add items from compare1 that dont match any in compare2 to array
				array_push(longer_items_arr, arg1[i]);
				array_push(position_arr, i);
			}
		}
		
	}
	// Prepare info for return
	var longer_items = {
		Array : longer_items_arr,
		ArrPos : position_arr
	}
	
	return longer_items;
}

function Script_Load_Room() {
	if (room == ROOM_000_Game_Begin
	|| room == ROOM_001_Studio_Screen
	|| room == ROOM_002_Intro_Video
	|| room == ROOM_003_Intro_Video_1
	|| room == ROOM_004_Intro_Video_2
	|| room == ROOM_005_Intro_Video_3
	|| room == ROOM_006_Title_Screen) {
		return;
	}
	// Assume each editor-placed item has a unique ID stored in variable unique_id.
	if (is_struct(global.levelData)) {
		// Get the array of 'active' items for this room from the saved state.
		var saved_items = global.levelData.OBJs.ItemData;
		var saved_warps = global.levelData.OBJs.WarpData;
		var saved_NPCs = global.levelData.OBJs.NPCData;
		
		var GlobalItemList = global.item_list;
		var GlobalWarpList = global.warp_list;
		var GlobalNPCsList = global.NPC_list;
    
    
		// Loop through the saved items; if this item appears in the saved state,
		// then it hasn’t been picked up.
		var SAVE_Length = array_length(saved_items);
		var GlobalLength = ds_list_size(GlobalItemList);
		// A flag to check if this item was already picked up.
		var destroy_item;
		
		if (SAVE_Length >= GlobalLength) {
			destroy_item = false;
		}
		if (SAVE_Length <= GlobalLength) {
			destroy_item = true;
		}
		
		var longer_items = Script_Compare_Longer_List(saved_items, SAVE_Length, GlobalItemList, GlobalLength, destroy_item);
		
		for (var i = 0; i < array_length(longer_items.Array); i++) {
		    if (saved_items[i].unique_id == unique_id) {
		        still_exists = true;
		        break;
		    }
		}
		for (var i = 0; i < array_length(saved_warps); i++) {
		    if (saved_warps[i].unique_id == unique_id) {
		        still_exists = true;
		        break;
		    }
		}
		//for (var i = 0; i < array_length(saved_ROOMs); i++) {
		//    if (saved_ROOMs[i].unique_id == unique_id) {
		//        still_exists = true;
		//        break;
		//    }
		//}
		for (var i = 0; i < array_length(saved_NPCs); i++) {
		    if (saved_NPCs[i].unique_id == unique_id) {
		        still_exists = true;
		        break;
		    }
		}
    
		// If the item was not found in the saved state, destroy it.
		if (!still_exists) {
		    instance_destroy();
		}
	}


	// Will place any items that may be placed by the player. 
	// i.e, if in room save state, but not on load, they are placed 


    // Check if there is saved data for the current room.
    if (!is_struct(global.levelData)) {
        show_debug_message("No saved data for room: " + string(room));
        return;
    }
	
	if (!global.levelData.ROOM) {
        show_debug_message("No ROOM data: " + string(room));
        return;
	}
    
    // Retrieve the room-specific save data.
    var ROOM_data = global.levelData;
    var OBJs_struct = ROOM_data.OBJs;
    
    if (!is_struct(OBJs_struct)) {
        show_debug_message("Saved items data for room " + string(room) + " is invalid.");
        return;
    }
    
    // Get the layer id for the item layer
    var item_layer = layer_get_id("Item_Layer");
    
    // Loop through each saved item.
    for (var i = 0; i < OBJs_struct.ItemAmount; i++) {
        var item_info = items_struct.ItemData[i];
        
        // Extract X and Y values.
		var item = item_info.obj;
        var pos_x = item_info.objX;
        var pos_y = item_info.objY;
        
        // Create an instance of the item at the saved x and y on layer "items".
        // Make sure that 'item' corresponds to the correct object type.
        instance_create_depth(pos_x, pos_y, "Item_Layer", item);
        
        show_debug_message("Created item at (" + string(pos_x) + ", " + string(pos_y) + ")");
    }
    
    show_debug_message("Room " 
	+ string(room) 
	+ " loaded with " 
	+ string(items_struct.ItemAmount) 
	+ " item(s).");
}