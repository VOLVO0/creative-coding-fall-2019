
Ball[] b;
int COUNT = 500;

void setup() {
  size(640, 480);
  b = new Ball[COUNT];
  
  startBouncing();
  
  colorMode(HSB, 360, 100, 100);
}

int lastb = 0;
void startBouncing() {
  b[lastb] = new Ball(random(360));
  lastb = (lastb + 1) % COUNT;
  //for (int n = 0; n < COUNT; n++) {
  //  b[n] = new Ball(random(360));
  //}
}

void draw() {
  fill(51, 10);
  noStroke();
  rect(0, 0, width, height);
  
  for (int n = 0; n < COUNT; n++) {
    Ball _b = b[n]; // might be null
    if (_b != null && _b.alive) {
      b[n].display();
      b[n].move();
      b[n].checkEdges();
    }
  }
  
  if (mousePressed) {
    startBouncing();
  }
}
