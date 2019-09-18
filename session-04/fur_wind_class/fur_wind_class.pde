int COLUMNS = 40;
int ROWS = 20;

Hair[] fur;

void setup() {
  size(500, 500);
  noStroke();
  background(0);
  rectMode(CENTER);
  float xstep = width / (COLUMNS - 2);
  float ystep = height / (ROWS - 2);
  
  fur = new Hair[COLUMNS * ROWS];
  for (int y=0; y < ROWS; y++) {
    for (int x=0; x < COLUMNS; x++) {
      println((COLUMNS * y) + x);
      fur[x + (y * COLUMNS)] = new Hair(x * xstep, y * ystep);
    }
  }
}

void draw() {
  background(0);
  stroke(255);
  noFill();

  strokeWeight(2);
  
  for (Hair h : fur) {
    h.update(mouseX, mouseY);
    h.draw();
  }
}

class Hair {
  float x, y;
  float rot;
  
  Hair(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void draw() {
    float cval = map(rot, 0, TWO_PI, 255, 0); 
    
    pushMatrix();
    stroke(cval);
    translate(x, y);
    rotate(rot);
    line(0, 0, 30, 0);
    popMatrix();       
  }
  
  void update(float otherx, float othery) {
    float dis = dist(x, y, otherx, othery);
    float deg = map(dis, 0, dist(0, 0, width, height), 0, 360);
    rot = radians(deg);
  }
}
