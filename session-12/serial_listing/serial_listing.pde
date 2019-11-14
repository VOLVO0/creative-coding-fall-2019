import processing.serial.*;

void setup() {
  // List all the available serial ports.
  println("Connected devices:");
  printArray(Serial.list());
}
