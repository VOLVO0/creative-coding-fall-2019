// enter: record
// space: jitter
// 1 - 9: sample

import processing.video.*;

String cameraName = "USB Camera";
Capture cam;
boolean spaced, reverse;
static int FLEN = 120;
PImage[] film;

int idx;
int pidx;

void log_message(String message) {
  println(message);
}

void setup() {
  size(640, 360);
  pixelDensity(1);
  
  spaced = false;
  reverse = true;
  noStroke();

  film = new PImage[FLEN];

  idx = 0;
  pidx = 0;
  frameRate(16);

  // The camera can be initialized directly using an element
  // from the array returned by list():
  // cam = new Capture(this, cameras[0]);
  // Or, the settings can be defined based on the text in the list
  cam = new Capture(this, 640, 360, "USB Camera", 30);

  // Start capturing the images from the camera
  cam.start();
}

PImage frame;

int c = 0, fr = 63, ne = 81;
float rr = 1.0;

void draw() {
  background(0);

  if (jitter) {
    frame = film[(int)random(120)];
  } else {
    frame = film[119 - pidx];
  }
  if (frame != null) {
    c++;
    image(frame, 0, 0, width, height);
    
    if (c % fr == 0) {
      filter(GRAY);
    }
  }
  
  pidx = (pidx + 1) % FLEN;
  if (pidx == 0) {
    fr = (int)random(60) + 1;
    ne = (int)random(60) + 1;
    rr = random(1.0);
  }

  if (spaced) {
    if (cam.available() == true) {
      cam.read();
      PImage newFrame = cam.get();
      film[idx] = newFrame;
      idx = (idx + 1) % FLEN;
      image(newFrame, 20, 20, 213, 120);
    }
    fill(255, 0, 0);
    ellipse(20, 20, 20, 20);
  }
}

boolean jitter = false;

HashMap<String, Boolean> keys = new HashMap();

void keyPressed() {
  if (keyCode == ENTER || keyCode == RETURN) {
    spaced = true;
  } else if (key == ' ') {
    jitter = true;
  } else if (key >= '1' && key <= '9') {
    println("char " + Character.getNumericValue(key));
    pidx = Character.getNumericValue(key) * 11;
  }
}

void keyReleased() {
  if (keyCode == ENTER || keyCode == RETURN) {
    spaced = false;
  } else if (key == ' ') {
    jitter = false;
  }
}
