import processing.serial.*;

int lf = 10;    // Linefeed in ASCII
Serial myPort;  // The serial port

void setup() {
  size(600, 600, P3D);
  
  // List all the available serial ports
  printArray(Serial.list());
  
  // Open the port you are using at the rate you want:
  myPort = new Serial(this, Serial.list()[3], 9600);
}

String inString;
float accel[] = {0, 0, 0};
float hist[][];

void draw() {
  while (myPort.available() > 0) {
    String inString = myPort.readStringUntil(lf);
    if (inString != null) {
      // print(inString);
      float vals[] = float(split(inString, ' '));   
      if (vals.length == 3) {
        println("x: ", vals[0], "\ty:", vals[1], "\tz:", vals[2]);
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
  fill(100, 100, 200);
  noStroke();
  lights();
  
  translate(width/2, height/2);
  rotateX(map(accel[0], -10, 10, -PI, PI));
  rotateY(map(accel[1], -10, 10, -PI, PI));
  box(300);
}
