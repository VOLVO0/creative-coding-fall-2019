// Audio file from:
// https://freemusicarchive.org/music/Loyalty_Freak_Music/WITCHY_BATTY_SPOOKY_HALLOWEEN_IN_SEPTEMBER_/The_Swamp_1569

import processing.sound.*;

SoundFile sound;

void setup() {
  size(600, 600);
  sound = new SoundFile(this, "swamp.mp3");
  sound.loop();
}

void draw() {
  // what about sound.rate?
  // what kind of data can we get about the sound?
}
