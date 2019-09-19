void setup() {
  size(640, 480);
}

void draw() {
  background(51);

  float angle = TWO_PI / 5;
  float halfAngle = angle/2.0;
  float radius1 = 30;
  float radius2 = 70;
  float x = width/2;
  float y = height/2;

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
