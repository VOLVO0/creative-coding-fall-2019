class Ball {
  float x = 0;
  float y = 0;
  float c = 170;

  float speedx = 4;
  float speedy = 2.5;
  
  boolean alive = true;
  
  Ball(float clr) {
    speedx = random(4, 8);
    speedy = random(-2, 2);
    x = mouseX;
    y = mouseY;
    c = clr;
  }

  void display() {
    fill(c, 40, 100);
    ellipse(x, y, 30, 30);
  }

  void move() {
    x += speedx;
    y += speedy;
  }

  void checkEdges() {
    if (x > width || x < 0) {
      alive = false;
    }
    if (y > height || y < 0) {
      alive = false;
    }
  }
}
