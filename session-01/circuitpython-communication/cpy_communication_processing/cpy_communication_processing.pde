import processing.serial.*;

int lf = 10;    // Linefeed in ASCII
Serial myPort;  // The serial port

void setup() {
  size(800, 600, P3D);
  
  // List all the available serial ports
  printArray(Serial.list());
  
  // Open the port you are using at the rate you want:
  myPort = new Serial(this, Serial.list()[3], 9600);
}

String inString;
float accel[] = {0, 0, 0};
float hist[][];

color lavender = color(100, 100, 200);
color alarm = color(255, 0, 0);

void draw() {
  while (myPort.available() > 0) {
    String inString = myPort.readStringUntil(lf);
    if (inString != null) {
      float vals[] = float(split(inString, ' '));   
      if (vals.length == 3) {
        // println("x: ", vals[0], "\ty:", vals[1], "\tz:", vals[2]);
        // copy temporary values into accel values
        accel[0] = vals[0];
        accel[1] = vals[1];
        accel[2] = vals[2];
      } else {
        print(inString);
      }
    }
  }
  
  background(0);
  fill(lerpColor(lavender, alarm, constrain(abs(accel[1]), 0, 10) / 10.0));
  noStroke();
  lights();
  
  int steps = 1;
  float offset = 1 / float(steps + 1) * width;
  for (int i=0; i < steps; i++) {
    pushMatrix();
    translate((i + 1) * offset, height/2);
    rotateX(map(accel[0], -10, 10, -PI, PI));
    rotateY(map(accel[1], -10, 10, -PI, PI));
    box(width * 0.2);
    popMatrix();
  }
  
}
