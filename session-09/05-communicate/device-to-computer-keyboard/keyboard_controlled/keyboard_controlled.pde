void setup() {
  size(200, 200);
}

void draw() {
}

void keyPressed() {
  println("KEY PRESSED", key);
  if (key == 'a') {
    background(0, 200, 0);
  } else {
    background(0, 0, 200);
  }
}
