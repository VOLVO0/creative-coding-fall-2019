class Particle {
  float x, y, range;
  float speed = .3;
  
  Particle() {
    x = random(width);
    y = random(height);
    range = random(30, 50);
  }
  
  Particle(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  // move, avoiding spots
  void update(ArrayList<Particle> spots) {
    for (Particle p : spots) {
      float d = dist(x, y, p.x, p.y);
      if (d < range) {
        if (x < p.x) {
          x -= speed;
        } else {
          x += speed;
        }
        
        if (y < p.y) {
          y -= speed;
        } else {
          y += speed;
        }
      }
    }
    
  }
  
  void display() {
    strokeWeight(3);
    stroke(#e18c4c, 30);
    point(x, y);
  }
}
