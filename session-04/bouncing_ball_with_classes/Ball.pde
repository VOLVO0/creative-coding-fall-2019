class Ball {
  float x = 0;
  float y = 0;
  float c = 170;

  float speedx = 4;
  float speedy = 2.5;
  
  Ball(float r) {
    speedx = random(-10, 10);
    speedy = random(-10, 10);
    x = mouseX;
    y = mouseY;
    c = r;
  }

  void display() {
    fill(c, 40, 100);
    // stroke(255);
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
