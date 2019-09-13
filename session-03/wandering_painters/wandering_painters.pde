float[] x;
float[] y;
int COUNT = 1000;
int RATE = 1;

void setup() {
  size(600, 600);
  x = new float[COUNT];
  y = new float[COUNT];

  for (int n = 0; n < COUNT; n++) {
    x[n] = random(width);
    y[n] = random(height);
  }
  
  colorMode(HSB, 255, 100, 100);

  background(0);
}

void draw() {
  stroke(255, 100);
  strokeWeight(4);

  for (int n = 0; n < COUNT; n++) {
    stroke(n % 255, 100, 100);
    float cx = x[n];
    float cy = y[n];
    point(cx, cy);
    x[n] = x[n] + random(-RATE, RATE);
    y[n] = y[n] + random(-RATE, RATE);
  }
}
