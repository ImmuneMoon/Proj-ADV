xpos = 0; // Xposition of the camera
a = 1; // Transparancy of black background, 1 is fully opaque
fadeout = 0; // Controls fade to black transparancy, 0 means no fadeout, 1 queues variable "a" to start going to 0

str = ""; // Line of text if you want to draw any during cutscene
print = ""; // For holding the current text from str, when displaying one character at a time

l = 0; // The current letter the script is up to in "str" to put into "print"
next = 0; // Decides which string to draw from out of an array of strings, so when finished w/ one, you can get the next

hold_key = 0; // Variable for determining if the player has held the skip key

strings[0] = "First line";
strings[1] = "Second line";
strings[2] = "This is the third\nline of text!";