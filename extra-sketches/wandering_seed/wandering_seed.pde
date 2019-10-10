Seed c;
int LEVELS = 6;

void setup() {
  size(600, 800);
  c = new Seed(width/2, height - 20, 0, -0.5, 0);
  noStroke();
  background(0);
}

void draw() {
  loadPixels();
  c.grow();
  c.display();
  c.cleanup();
  
  if (c.dead()) {
    println("DONE");
    saveFrame();
    noLoop();
  }
}

class Seed {
  float x, y, dx, dy, h;
  int s, g, l, m, ng;
  color c;
  ArrayList<Seed> children;
  boolean alive;
  
  Seed(float x, float y, float dx, float dy, int lvl) {
    this.x = x;
    this.y = y;
    this.dx = dx;
    this.dy = dy;
    l = lvl;
    children = new ArrayList<Seed>();
    alive = true;
    
    // height of segment before branching
    s = int(map(l, 0, LEVELS, 180, 45));
    g = 0;
    ng = s;
    
    // number of branches that can spawn from this seed 
    m = int(map(l, 0, LEVELS, 4, 1));
    
    // maximum height of this branch
    h = s * m + random(20);
    
    // color selection
    c = lerpColor(#EF7044, #5BB7FF, map(l, 0, LEVELS, 0, .8));
  }
  
  void cleanup() {
    for (int n=children.size() - 1; n > 0; n--) {
      Seed child = children.get(n);
      child.cleanup();
      if (child.dead()) {
        children.remove(n);
      }
    }
  }
  
  void grow() {    
    for (Seed child : children) {
      child.grow();
    }
    
    if (!alive) return;
    
    x += random(-1, 1) + dx;
    y += random(-1, 1) + dy;
    g++;
    
    if (g > ng && children.size() < m && l < LEVELS) {
      ng = g + s;
      float ndx;
      if (dx == 0) {
        ndx = random(-0.2, 0.2) * 2;
      } else if (dx > 0) {
        ndx = random(0.3) * 2;
      } else {
        ndx = random(-0.3) * 2;
      }
      float ndy = random(-0.5) - 0.1;
      // println(l, "SEED", ndx, ndy);
      children.add(new Seed(x, y, ndx, ndy + 0.05, l + 1));
    }
    
    boolean out = x < 0 || x > width || y < 0 || y > height;
    boolean old = g > h;
    //int pidx = int(ceil(y) * width + ceil(x));
    //boolean hungry = false;
    //if (!out) {
    //  color npix = pixels[pidx];
    //  hungry = red(npix) > 0 || green(npix) > 0 || blue(npix) > 0;
    //}
    if (out || old) {
      alive = false;
    }
  }
  
  void display() {    
    for (Seed child : children) {
      child.display();
    }
    
    if (!alive) return;
    
    stroke(c, 40);
    strokeWeight(map(l, 0, LEVELS, 8, 4));
    point(x, y);
  }
  
  boolean dead() {
    boolean alive_children = false;
    for (Seed child : children) {
      if (!child.dead()) alive_children = true;
    }

    return !(alive || alive_children);
  }
}
