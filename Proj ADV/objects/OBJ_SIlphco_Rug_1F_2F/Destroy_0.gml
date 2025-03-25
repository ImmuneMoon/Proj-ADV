// Delete from global ds warp list when the instance is no longer loaded
var index = ds_list_find_index(global.warp_list, id);
if (index != -1) {
    ds_list_delete(global.warp_list, index);
}
