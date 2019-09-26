import processing.video.*;
import gab.opencv.*;
import java.awt.Rectangle;

OpenCV opencv;
Rectangle[] objects;

Capture cam;

void setup() {
  size(960, 540);
  opencv = new OpenCV(this, width, height);
  
  // Available detection cascades: 
  // 
  //   CASCADE_FRONTALFACE
  //   CASCADE_PEDESTRIANS
  //   CASCADE_EYE
  //   CASCADE_CLOCK
  //   CASCADE_NOSE
  //   CASCADE_MOUTH
  //   CASCADE_UPPERBODY
  //   CASCADE_LOWERBODY
  //   CASCADE_FULLBODY
  //   CASCADE_PEDESTRIAN
  //   CASCADE_RIGHT_EAR
  //   CASCADE_PROFILEFACE
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE); 
  
  // make sure objects is not null
  objects = new Rectangle[0];
  
  // Or, the settings can be defined based on the text in the list
  cam = new Capture(this, 960, 540, "HD Pro Webcam C920 #2", 30);

  // Start capturing the images from the camera
  cam.start();
}

void draw() {

  if (cam.available() == true) {
    cam.read();
    PImage newFrame = cam.get();
    image(newFrame, 0, 0, width, height);
    
    // Do object detection
    opencv.loadImage(newFrame);
    objects = opencv.detect();
    // `objects` now contains a list of objects OpenCV detected
  }
  
  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  for (int i = 0; i < objects.length; i++) {
    Rectangle r = objects[i];
    
    // Draw the rectangle surrounding the object
    rect(r.x, r.y, r.width, r.height);
  }
}
