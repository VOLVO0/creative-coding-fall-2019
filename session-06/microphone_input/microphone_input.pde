import processing.sound.*;

AudioIn mic;
Amplitude volume;

void setup() {
  size(512, 512);
 
  mic = new AudioIn(this, 0);
  mic.start();
  
  volume = new Amplitude(this);
  volume.input(mic);
}

void draw() {
  background(0);
  float vol = volume.analyze();
  text(vol, 0, 30);
}
