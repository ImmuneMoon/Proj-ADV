//global volume control
global.masterVolume = .25;
global.musicVolume = .25;

//info for the song we are currntly playing / trying to play
songInstance = noone;
songAsset = noone;
targetSongAsset = noone;
endFadeOutTime = 0;//how many frames to fade out the song currently playing
startFadeInTime = 0;//how many frames to fade in the new song
fadeInInstVol = 1;//the volume of songInstance

//for fading music out and stopping songs that are no longer playing
fadeOutInstances = array_create(0);//the audio instances to fade out
fadeOutInstVol = array_create(0);//the volumes of each individual audio instance
fadeOutInstTime = array_create(0);//how fast the fadeout should happen

songOverlap = false;

// Room tracking
currentRoom = room;
isTransitioning = false;

