function Script_Set_Song_Ingame( _song, _fadeOutCurrentSong = 0, _fadeIn = 0, _songOverlap = false ) {
	show_debug_message("Set song ingame Script acitve");
	//_song = set to any song (including "noone" to stop or fade the track out)
	//_fadeOutCurrentSong = time (in frames) the current song (if playing) will take to fade out
	//_fadeIn = time (in frames) the target song (if not "noone") will take to fade in
	//_songOverlap = should the new song overlap with any old songs playing?
	
	with( OBJ_Audio_Manager ) {
		targetSongAsset = _song;
		endFadeOutTime = _fadeOutCurrentSong;
		startFadeInTime = _fadeIn;
		songOverlap = _songOverlap;
	}
}