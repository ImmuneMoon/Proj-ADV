camera_set_view_pos(view_camera[0], xpos, 0); //Set cammera xpos
//xpos = max(xpos - 0.3, 0); // For moving the camera, if needed

if (!fadeout) {
	a = max(a - 0.005, 0.25); // Fades background by .005 until it reaches 0.25
}
else {
	a = min(a + 0.005, 1); // Fades to black
}