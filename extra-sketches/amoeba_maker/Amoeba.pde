class Amoeba {
  FloatList xs;
  FloatList ys;
  FloatList sw;
  float step;
  float[] dir;
  float[] center;
  boolean drawing;
  int nmx, nmy;
  float clr;
  
  Amoeba() {
    step = 0;
    drawing = true;
    xs = new FloatList();
    ys = new FloatList();
    sw = new FloatList();
    nmx = random(1) < 0.5 ? -1:1;
    nmy = random(1) < 0.5 ? -1:1;
    
    step = 0;
    clr = random(360);
    dir = new float[]{ random(-1,1), random(-1,1) };
  }
  
  // add a new point to the amoeba
  void add(float x, float y) {
    if (xs.size() == 0) {
      xs.append(x);
      ys.append(y);
      sw.append(random(4, 10));
      return;
    }
    
    float lx = xs.get(xs.size()-1);
    float ly = ys.get(ys.size()-1);
    if (dist(lx, ly, x, y) > 2) {
      xs.append(x);
      ys.append(y);
      
      float w = map(dist(lx, ly, x, y),
        2, 50, 14, 2);
      w = constrain(w, 2, 14);
      sw.append(w);
    }
  }
  
  void finish() {
    drawing = false;
  }
  
  // wiggle every point in the amoeba just a little bit
  void update() {
    if (drawing) return;
    step++;
    for (int n=0; n < xs.size(); n++) {
      float nx = noise((step + n) * .1) * dir[0] * 4;
      float ny = noise((step + n) * .1) * dir[1] * 4;
      
      xs.set(n, xs.get(n) + nx);
      ys.set(n, ys.get(n) + ny);
    }
  }
  
  void display() {
    if (drawing) {
      noFill();
    } else {
      fill(clr, 100, 100, 128);
    } 
    
    noStroke();
    beginShape();
    for (int n=0; n < xs.size(); n++) {
      vertex(
        xs.get(n), 
        ys.get(n)
      );
    }
    
    if (drawing) {
      endShape(LINE);
    } else {
      endShape(CLOSE);
    }
    
    if (xs.size() > 1) {
      for (int n=0; n < xs.size() - 1; n++) {
        // rotate stroke color through hue cycle
        stroke((clr + (n * .8)) % 360, 100, 100);
        strokeWeight(sw.get(n));
        line(xs.get(n), ys.get(n), 
             xs.get(n+1), ys.get(n+1));
      }
      
      if (!drawing) {
        int ln = xs.size() - 1;
        strokeWeight(sw.get(ln));
        line(xs.get(ln), ys.get(ln), 
             xs.get(0), ys.get(0));
      }
    } else if (xs.size() == 1) {
      stroke((clr) % 360, 100, 100);
      strokeWeight(sw.get(0));
      point(xs.get(0), ys.get(0));
    }
  }
  
  boolean dead() {
    boolean offscreen = true;
    for (int n=0; n < xs.size(); n++) {
      float x = xs.get(n);
      float y = ys.get(n);
      if ((x < width && x > 0) || (y < height && y > 0)) {
        offscreen = false;
        break;
      }
    }
    return offscreen;
  }
}
