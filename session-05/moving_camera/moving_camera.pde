import processing.video.*;
Capture video;

void setup() {
  size(640, 480);
  video = new Capture(this, 640, 480, "USB Camera #2", 30);
  video.start();    
}

void draw() {
  if (video.available()) {
    video.read();
    background(0);
    image(video, mouseX, mouseY, 100, 75);
  }
}
