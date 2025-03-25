function inventoryItem(_item_inst, _type, _amount) constructor {
    Item = _item_inst;
    ItemType = _type;
    Amount = _amount;
}

// Trying to integrate a backpack/ inventory w/ the idea that
// we can check the items picked up vs the ones in the room
// and not rely on deleting everything that isnt in our save file
function Script_Add_To_Inventory(item_inst, type, amount){
	var type_test_items
	global.PlayerInventory = new inventoryItem(item_inst, type, amount);
}

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