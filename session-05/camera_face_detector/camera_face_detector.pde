import processing.video.*;
import gab.opencv.*;
import java.awt.Rectangle;

OpenCV opencv;
Rectangle[] faces;

String cameraName = "USB Camera";
Capture cam;

void setup() {
  size(640, 480);
  opencv = new OpenCV(this, width, height);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE); 
  faces = new Rectangle[0];
  //faces = opencv.detect();
  
  // The camera can be initialized directly using an element
  // from the array returned by list():
  // cam = new Capture(this, cameras[0]);
  // Or, the settings can be defined based on the text in the list
  cam = new Capture(this, 640, 480, "USB Camera", 30);

  // Start capturing the images from the camera
  cam.start();
}

void draw() {
  // background(51);
  if (cam.available() == true) {
    cam.read();
    PImage newFrame = cam.get();
    // image(newFrame, 0, 0, width, height);
    opencv.loadImage(newFrame);
    faces = opencv.detect();
  }
  
  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  for (int i = 0; i < faces.length; i++) {
    float cx = faces[i].x + faces[i].width/2;
    float cy = faces[i].y + faces[i].height/2;
    ellipse(cx, cy, 40, 40);
  }
}
