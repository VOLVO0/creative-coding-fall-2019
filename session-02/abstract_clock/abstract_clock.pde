float w;
float s = 0;
float m = 0;
float h = 0;
float sub = 3;

void setup() {
  size(600, 600);
  frameRate(1);
  ellipseMode(CORNER);
  background(255);
  fill(0, 128, 75);
  noStroke();
  smooth(8);
  w = width/sub;
}

void draw() {
  ellipse(s * w, 0, w, w);
  s = s + 1;
  
  if (s == sub) {
    s = 0;
    ellipse(m * w, 0 + w, w, w);
    m += 1;
    if (m == sub) {
      ellipse(h * w, 0 + w + w, w, w);
      h += 1;
      m = 0;
      
      if (h == sub) {
        h = 0;
      }
    }
    fill(random(30, 180), random(100, 200), random(100, 255));
  }
}
