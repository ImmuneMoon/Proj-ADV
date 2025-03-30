function Script_Handle_A_Press(){
	show_debug_message("#### --- Script_Handle_A_Press --- ####")
	// if the player is facing an item
	if (global.facing_item != noone) {
		show_debug_message("Player is facing an item");
		var item_inst = global.facing_item;
		show_debug_message("Adding: " + string(item_inst) + "to inventory")
		
		Script_Add_To_Inventory(item_inst);
	}
	if (global.facing_NPC == true) {
		show_debug_message("Player is facing an NPC");
		global.interacting = true;
	}
	
}
/* <----
	Will be altered by the instance creation code of the object
	placed in the ROOM, in this format:
	
		ItemData = {
	
			ID : id,
	
			ItemType : "POKé BALLS",
	
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