function Inventory(Item, Section) constructor {
	var current_inventory = global.PlayerInventory;
	var _items_arr = current_inventory.ITEMS;
	var _key_items_arr = current_inventory.KEY_ITEMS;
	var _pokeballs_arr = current_inventory.POKe_BALLS;
	
	if (Section == "ITEMS") {
		array_push(_items_arr, Item);
	}	
	if (Section == "KEY_ITEMS") {
		array_push(_key_items_arr, Item);
	}	
	if (Section == "POKe_BALLS") {
		array_push(_pokeballs_arr, Item);
	}
	
	var updated_inv = {
		ITEMS : _items_arr,
		KEY_ITEMS : _key_items_arr,
		POKe_BALLS : _pokeballs_arr
	}
	return updated_inv;
}

// Trying to integrate a backpack/ inventory w/ the idea that
// we can check the items picked up vs the ones in the room
// and not rely on deleting everything that isnt in our save file
function Script_Add_To_Inventory(item_inst){
	var item_ID = item_inst.ID;
	if (instance_exists(item_ID)) {
		var item_TYPE = item_inst.ItemType;
		var updated_inv = new Inventory(item_inst, item_TYPE);
		instance_destroy(item_ID);
		ds_list_delete(global.item_list, item_inst);
		global.PlayerInventory = updated_inv;
	}
}


/* <----
	Will be altered by the instance creation code of the object
	placed in the ROOM, in this format:
	
		ItemData = {
	
			ID : id,
	
			ItemType : "POKe BALLS",
	
			ItemName : "POKé BALL",
	
			InventorySprite : SPR_Pokeball_Closed,
	
			Amount : 1,
	
			Description : @"
				A BALL thrown to catch a wild
				POKéMON. It is designed in a 
				capsule style.
			"
	
		}
	
	Change values based on what item you want it to be in the 
	instance creation code of the object instance in the ROOM.

*/



//function PlayerData() constructor{
//    function InventoryItem( _key, _quantity, _size) constructor{
//        key = _key;
//        quantity = _quantity;
//        size = _size;
//    }
//    function InventoryStruct( _parent) constructor{
//        parent = _parent;
//        ...
//        else{
//            var item = new parent.InventoryItem( _key, _quantity, _size);
//            data[? _key] = item;
//        }
//        ...
//    }

//    inventory = new InventoryStruct( self);
//}

//data = new PlayerData();
//data.inventory.addItem("Item", 2, 2)