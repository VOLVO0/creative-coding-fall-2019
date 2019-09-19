
Ball[] b;
int COUNT = 50;

void setup() {
  size(640, 480);
  b = new Ball[COUNT];
  
  startBouncing();
}

void startBouncing() {
  for (int n = 0; n < COUNT; n++) {
    b[n] = new Ball();
    b[n].speedx = random(-10, 10);
    b[n].speedy = random(-10, 10);
    b[n].x = mouseX;
    b[n].y = mouseY;
  }
}

void draw() {
  fill(51, 10);
  noStroke();
  rect(0, 0, width, height);
  
  for (int n = 0; n < COUNT; n++) {
    b[n].display();
    b[n].move();
    b[n].checkEdges();
  }
  
  if (mousePressed) {
    startBouncing();
  }
}
