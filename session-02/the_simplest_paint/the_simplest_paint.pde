void setup() {
  size(800, 800);
  background(0);
}

void draw() {
  if (mousePressed) {
    ellipse(mouseX, mouseY, 20, 20);
  }
  
  if (keyPressed) {
    background(0);
  }
}
