function Script_Load_Room() {
	show_debug_message("#### --- LOADING ROOM DATA --- ####")
	
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
		var saved_items;
		// Get the array of 'active' items for this room from the saved state.
		saved_items = global.levelData.OBJs.ItemData;
		show_debug_message("Saved items: " + string(saved_items));
		
		var GlobalItemList = global.item_list;
		show_debug_message("Global items: " + string(GlobalItemList));
    
    
		// Loop through the saved items; if this item appears in the saved state,
		// then it hasn’t been picked up.
		var SAVE_Length = array_length(saved_items);
		show_debug_message("Saved items length: " + string(SAVE_Length));
		var GlobalLength = ds_list_size(GlobalItemList);
		show_debug_message("Global items length: " + string(SAVE_Length));
		// A flag to check if this item was already picked up.
		var destroy_item;
		
		// Adding an item
		if (SAVE_Length >= GlobalLength) {
			show_debug_message("Save > Global, add item");
			destroy_item = false;
		}
		// Deleting an item
		if (SAVE_Length <= GlobalLength) {
			show_debug_message("Global > Save, delete item");
			destroy_item = true;
		}
		
		var longer_items = Script_Compare_Longer_List(saved_items, SAVE_Length, GlobalItemList, GlobalLength, destroy_item);
		// Make longer_items struct info available
		var long_items_arr = longer_items.Array;
		var long_items_arr_index = longer_items.ArrPos;
		
		// Add item
		if (destroy_item == false) {
			show_debug_message("Attempting to add item");
			for (var i = 0; i < array_length(long_items_arr); i++) {
				var item_info = long_items_arr[i]; 
				// Extract X and Y values.
				var item = item_info.obj;
				var pos_x = item_info.objX;
				var pos_y = item_info.objY;
        
				/* 
					Create an instance of the item at the saved x and y on layer "items".
					Make sure that 'item' corresponds to the correct object type.
					
					Note: Added item instance should add itself to the global item list automatically
				*/
					instance_create_depth(pos_x, pos_y, "Item_Layer", item);
        
				show_debug_message("Created item at (" + string(pos_x) + ", " + string(pos_y) + ")");
				show_debug_message("Room " 
				+ string(room) 
				+ " loaded with " 
				+ string(array_length(long_items_arr)) 
				+ " Added item(s).");
			}
		
		}
		// Destroy item
		if (destroy_item == true) {
			show_debug_message("Attempting to delete item");
			// Remove from ROOM
			for (var i = 0; i < array_length(long_items_arr); i++) {
				var item_info = long_items_arr[i]; 
				// Extract X and Y values.
				var item = item_info.obj;
				var pos_x = item_info.objX;
				var pos_y = item_info.objY;
				instance_destroy(long_items_arr[i]);
				show_debug_message("Deleted item at (" + string(pos_x) + ", " + string(pos_y) + ")");
			}
			// Remove from global list
			for (var i = 0; i < array_length(long_items_arr_index); i++) {
				var item_index = long_items_arr_index[i];
				ds_list_delete(GlobalItemList, item_index);
				show_debug_message("Removed item from Global list: " 
				+ string(GlobalItemList)
				+ " at index: "
				+ string(long_items_arr_index[i]));
			}
			show_debug_message("Room: " 
			+ string(room) 
			+ " loaded with: " 
			+ string(array_length(long_items_arr)) 
			+ " deleted item(s).");
		}
		
	}
		
		
	if (global.levelData.OBJs.WarpData) {
		var saved_warps = global.levelData.OBJs.WarpData;
		show_debug_message("Saved warps: " + string(saved_warps));
		var GlobalWarpList = global.warp_list;
	}
		
		
	if (global.levelData.OBJs.NPCData) {
		var saved_NPCs = global.levelData.OBJs.NPCData;
		show_debug_message("Saved warps: " + string(saved_NPCs));
		var GlobalNPCsList = global.NPC_list;
	}
		
		
		
//	for (var i = 0; i < array_length(longer_items.Array); i++) {
//	    if (saved_items[i].unique_id == unique_id) {
//	        still_exists = true;
//	        break;
//	    }
//	}
//	for (var i = 0; i < array_length(saved_warps); i++) {
//	    if (saved_warps[i].unique_id == unique_id) {
//	        still_exists = true;
//	        break;
//	    }
//	}
//	//for (var i = 0; i < array_length(saved_ROOMs); i++) {
//	//    if (saved_ROOMs[i].unique_id == unique_id) {
//	//        still_exists = true;
//	//        break;
//	//    }
//	//}
//	for (var i = 0; i < array_length(saved_NPCs); i++) {
//	    if (saved_NPCs[i].unique_id == unique_id) {
//	        still_exists = true;
//	        break;
//	    }
//	}
    
//	// If the item was not found in the saved state, destroy it.
//	if (!still_exists) {
//	    instance_destroy();
//	}
//}


//// Will place any items that may be placed by the player. 
//// i.e, if in room save state, but not on load, they are placed 


//// Check if there is saved data for the current room.
//if (!is_struct(global.levelData)) {
//    show_debug_message("No saved data for room: " + string(room));
//    return;
//}
	
//if (!global.levelData.ROOM) {
//    show_debug_message("No ROOM data: " + string(room));
//    return;
//}
    
//// Retrieve the room-specific save data.
//var ROOM_data = global.levelData;
//var OBJs_struct = ROOM_data.OBJs;
    
//if (!is_struct(OBJs_struct)) {
//    show_debug_message("Saved items data for room " + string(room) + " is invalid.");
//    return;
//}
    
//// Get the layer id for the item layer
//var item_layer = layer_get_id("Item_Layer");

    

}