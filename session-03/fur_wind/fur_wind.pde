
void setup() {
  size(500, 500);
  noStroke();
  background(0);
  rectMode(CENTER);
}

void draw() {

  background(0);
  stroke(255);
  noFill();

  strokeWeight(2);
  for (int y=0; y < 20; y++) {
    for (int x=0; x < 20; x++) {
      float cx = 30 * x;
      float cy = 30 * y;
      
      float d = dist(cx, cy, mouseX, mouseY);
      float r = map(d, 0, width, 0, TWO_PI);
      
      pushMatrix();
      translate(cx, cy);
      rotate(r);
      line(0, 0, 0, 20);
      popMatrix();
    }
  }
}
