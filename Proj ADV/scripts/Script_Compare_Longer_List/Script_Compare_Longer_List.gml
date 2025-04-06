function Script_Compare_Longer_List(SAVEList, SAVELength, GlobalList, GlobalLength, Remove) {
	show_debug_message("#### --- Script_Compare_Longer_List ACTIVE --- ####");
	
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