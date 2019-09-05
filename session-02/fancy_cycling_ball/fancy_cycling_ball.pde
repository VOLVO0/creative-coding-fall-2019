int a = 0; // cycle

void setup() {
  size(400, 400);
}

void draw() {
  background(0);
  a = (a + 2) % width;
  ellipse(a, height/2, 20, 20); 
}
