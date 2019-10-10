
class Branch {
  float x, y, t; // t - segments
  float h, r, rate, scale; // h - segment length
  FloatList rs;
  int rl, l;
  
  float age = 0;
  float time = 0;
  
  ArrayList<Branch> branches;

  Branch(float rot, int lvl) {
    branches = new ArrayList<Branch>();
    rs = new FloatList();
    r = rot;
    l = lvl;
    scale = map(l, 0, MAX_LEVEL, 10, 1);
    rate = random(1, 3);
    
    h = map(l, 0, MAX_LEVEL, width * .02, width * .015);;
    rl = random(1) > 0.5 ? 1 : -1;
    
    t = 4; // map(l, 0, MAX_LEVEL, 11, 5); 
    for (int n = 0; n < t; n++) {
      rs.append(random(-0.3, 0.3)); 
    }
  }

  void grow() {
    if (l < MAX_LEVEL) {
      branches.add(new Branch(-PI * random(0.2), l + 1));
      branches.add(new Branch(PI * random(0.2), l + 1));
    }
  }

  void update() {
    time++;
    
    int curseg = floor(age / h);
    if (curseg < t) {
      age = min(age + rate, t * h);
    } else if (branches.size() == 0 && curseg == t) {    
      grow();
    }

    for (Branch f : branches) {
      f.update();
    }
  }

  void display() {
    pushMatrix();
    translate(x, y);
    rotate(r);
    
    stroke(
      map(l, 0, MAX_LEVEL, 40, 170), 
      170, 
      map(l, 0, MAX_LEVEL, 255, 40)
    );
    
    strokeWeight(map(time, 0, MAX_TIME, scale*.3, scale));
    
    int current = floor(age / h);
    for (int n=0; n < current; n++) {
      line(0, 0, 0, -h);
      translate(0, -h);
      rotate(rs.get(n));
    }
    
    if (age < h * t) {
      float prog = (age - current * h) / h;
      line(0, 0, 0, -lerp(0, h, prog));
    }

    for (Branch f : branches) {
      f.display();
    }
    popMatrix();
  }
}
