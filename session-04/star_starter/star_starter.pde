void setup() {
  size(640, 480);
}

void draw() {
  background(51);
  drawStar(mouseX, mouseY, 3.0, 5);
  drawStar(mouseX + 120, mouseY, 2.5, 8);
  drawStar(mouseX + 220, mouseY, 0.5, 75);
}

void drawStar(float x, float y, float multiplier, float points) {
  float angle = TWO_PI / points;
  float halfAngle = angle/2.0;
  float radius1 = 30 * multiplier;
  float radius2 = 70 * multiplier;
 
  beginShape(); 
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE); 
}
