class Ball {
  float x = 0;
  float y = 0;

  float speedx = 4;
  float speedy = 2.5;

  void display() {
    fill(170);
    stroke(255);
    ellipse(x, y, 30, 30);
  }

  void move() {
    x += speedx;
    y += speedy;
  }

  void checkEdges() {
    if (x > width || x < 0) {
      speedx = -speedx;
    }
    if (y > height || y < 0) {
      speedy = -speedy;
    }
  }
}
