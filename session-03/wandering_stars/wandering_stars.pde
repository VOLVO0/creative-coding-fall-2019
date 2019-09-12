int COUNT = 8;

float[] x = new float[COUNT];
float[] y = new float[COUNT];

void setup() {
  size(600, 600);
  background(0);
  stroke(255, 50);
  strokeWeight(4);
  
  for (int c = 0; c < COUNT; c++) {
    x[c] = random(width);
    y[c] = random(height);
  } 
}

void draw() {
  for (int c = 0; c < COUNT; c++) {
    float cx = x[c];
    float cy = y[c];
    
    point(cx, cy);
    
    x[c] += random(-4, 4);
    y[c] += random(-4, 4);
  }
}
