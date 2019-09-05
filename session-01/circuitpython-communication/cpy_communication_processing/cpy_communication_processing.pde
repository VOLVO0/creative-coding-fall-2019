import processing.serial.*;

color safety = color(100, 100, 200);
color alarm = color(255, 0, 0);
int shapes = 3;

// create a reference to the serial port. this is how we will get data
Serial myPort;  

void setup() {
  size(800, 600, P3D);
  
  // List all the available serial ports
  printArray(Serial.list());
  
  // open the port you are using at the rate your device is sending data
  myPort = new Serial(this, Serial.list()[3], 9600);
}


int lf = 10;    // Linefeed in ASCII
String inString;
float accel[] = {0, 0, 0}; 

void draw() {
  while (myPort.available() > 0) {
    // read bytes from the serial port until a linefeed character is found
    String inString = myPort.readStringUntil(lf);
    
    // if data was received...
    if (inString != null) {
      // parse input into x, y, z accelerometer data
      float vals[] = float(split(inString, ' '));   
      if (vals.length == 3) {
        // println("x: ", vals[0], "\ty:", vals[1], "\tz:", vals[2]);
        // copy temporary values into accel values
        accel[0] = vals[0];
        accel[1] = vals[1];
        accel[2] = vals[2];
      } else {
        // unfamiliar data! print it so we can check it out
        print(inString);
      }
    }
  }
  
  // set frame color and rendering details
  background(0);
  fill(lerpColor(safety, alarm, constrain(abs(accel[1]), 0, 10) / 10.0));
  noStroke();
  lights();
  
  // draw cube[s]
  float offset = 1 / float(shapes + 1) * width;
  for (int i=0; i < shapes; i++) {
    pushMatrix();
    translate((i + 1) * offset, height/2);
    rotateX(map(accel[0], -10, 10, -PI, PI));
    rotateY(map(accel[1], -10, 10, -PI, PI));
    box(width * 0.2);
    popMatrix();
  }
}
