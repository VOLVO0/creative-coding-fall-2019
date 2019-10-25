float[] x = new float[0];
float[] y = new float[0];
float[] s = new float[0];

void setup() {
  size(800, 800, P3D);
  smooth();
  
  makeCube();
}

void draw() {
  background(51);
  
  noFill();
  strokeWeight(2);
  
  for (int n=0; n < x.length; n++) {
    pushMatrix();
    translate(x[n], y[n], s[n]);
    rotateY(frameCount * 0.1);
    rotateX(frameCount * 0.01);
    box(100);
    popMatrix();
  }
  
}

void keyPressed() {
  makeCube();
}

void makeCube() {
  x = append(x, random(width));
  y = append(y, random(height));
  s = append(s, random(-800, 800));
}
