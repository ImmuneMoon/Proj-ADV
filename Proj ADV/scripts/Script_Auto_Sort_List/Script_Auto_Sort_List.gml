function Script_Auto_Sort_List(GlobalList){
	show_debug_message("Sorting: " + string(GlobalList));
    // Save the state of the room you're leaving
    var count = ds_list_size(GlobalList);
	show_debug_message("Size = " + string(count));
    var OBJs_array = [];
    var inst_Item_Data;
	var inst;
	
	if (count < 1) {
		return OBJs_array;
	}
    
	for (var i = 0; i < count; i++) {
	    inst_Item_Data = GlobalList[| i];
	    show_debug_message("inst_Item_Data: " + string(inst_Item_Data));

	    // Check if inst_Item_Data is a struct and has a key "ID".
	    if (is_struct(inst_Item_Data) && variable_instance_exists(inst_Item_Data, "ID")) {
	        inst = inst_Item_Data.ID;
	    } else {
	        inst = inst_Item_Data; // Assume it's directly an instance.
	    }

	    show_debug_message("Instance: " + string(inst));

	    if (instance_exists(inst)) {
	        var OBJ_entry = {
	            objX : inst.x,
	            objY : inst.y,
	            obj  : inst, // saving the instance reference
	            unique_id: i
	        };
	        array_push(OBJs_array, OBJ_entry);
	    }
	}
	return OBJs_array;
}