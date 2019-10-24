void setup() {
  size(400, 400, P3D);
  smooth();
}

void draw() {
  background(51);
  
  noFill();
  strokeWeight(2);
  pushMatrix();
  translate(width/2, height/2);
  rotateY(frameCount * 0.1);
  rotateX(frameCount * 0.01);
  box(100);
  popMatrix();
  
  //   setup,   check,  change
  fill(200, 200, 0);
  for (int i=0; i < 10; i++) {
    ellipse(random(width), random(height), 10, 10);
  }
}
