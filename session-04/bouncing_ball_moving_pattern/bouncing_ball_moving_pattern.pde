void setup() {
  size(800, 700);
  
  b = new Ball(200);
}

float x = 0, y = 0;
Ball b;
void draw() {
  background(51);
  
  b.move();
  b.checkEdges();
  pattern(b.x, b.y);
}

void pattern(float x, float y) {
  rect(x, y, 10, 10);
  rect(x + 20, y, 10, 10);
  rect(x, y + 20, 10, 10);
  rect(x + 20, y + 20, 10, 10);
  ellipse(x + 15, y + 15, 10, 10);
}
