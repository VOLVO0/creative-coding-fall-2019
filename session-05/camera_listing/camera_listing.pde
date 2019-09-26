/* 

 Find and list all cameras attached to this computer.
 
 */

import processing.video.*;

Capture video;
String[] cameras;

void setup() {
  size(900, 900);
  cameras = Capture.list();  
  println("Available cameras:");
  printArray(cameras);
  textSize(24);
  textLeading(20);
  
  // you should see lines that look like:
  //   
  //   name=HD Pro Webcam C920 #2,size=960x540,fps=30
  // 
}

void draw() {
  background(0);
  fill(255);
  for (int line=0; line < cameras.length; line++) {
    text(cameras[line], 20, line * 30 + 30);
  }
}
