import processing.video.*;
import gab.opencv.*;


OpenCV opencv;
String cameraName = "USB Camera";
Capture cam;


void setup() {
  size(640, 360);
  
  
  opencv = new OpenCV(this, "test.jpg");
  size(1080, 720);

  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  faces = opencv.detect();
  
  // The camera can be initialized directly using an element
  // from the array returned by list():
  // cam = new Capture(this, cameras[0]);
  // Or, the settings can be defined based on the text in the list
  cam = new Capture(this, 640, 360, "USB Camera", 30);

  // Start capturing the images from the camera
  cam.start();
}

void draw() {
  background(51);
  if (cam.available() == true) {
    PImage newFrame = cam.get();
    image(newFrame, 0, 0);
  }
  
  image(opencv.getInput(), 0, 0);

  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  for (int i = 0; i < faces.length; i++) {
    rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
    // ellipse(faces[i].x, faces[i].y, faces[i].width, faces[i].width);
  }
}
