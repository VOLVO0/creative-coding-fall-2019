import gab.opencv.*;
import processing.video.*;

OpenCV opencv;
Capture cam;

void setup() {
  size(720, 480);
  cam = new Capture(this, 720, 480, "USB Camera #2", 30);
  cam.start();
  opencv = new OpenCV(this, 720, 480);
  opencv.startBackgroundSubtraction(5, 3, 0.5);
}

void draw() {
  if (cam.available()) {
    cam.read();
    PImage video = cam.get();
    image(video, 0, 0);
    
    opencv.loadImage(video);
    opencv.updateBackground();

    opencv.dilate();
    opencv.erode();

    fill(255, 0, 0);
    stroke(255, 0, 0);
    strokeWeight(3);
    for (Contour contour : opencv.findContours()) {
      contour.draw();
    }
  }
}
