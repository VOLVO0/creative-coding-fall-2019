Particle[] parts;
ArrayList<Particle> spots;
int COUNT = 10000;

void setup() {
  size(800, 600);
  background(0);
  parts = new Particle[COUNT];
  for (int i=0; i < COUNT; i++) {
    parts[i] = new Particle();
  }
  
  spots = new ArrayList<Particle>();
}

void draw() {
  fill(0, 5);
  rect(0, 0, width, height);
  // background(0);
  for (int i=0; i < COUNT; i++) {
    parts[i].update(spots);
    parts[i].display();
  }
}

Particle lp;
void mouseDragged() {
  //Particle lp = spots.get(spots.size()-1);
  if (lp == null || 
      dist(mouseX, mouseY, lp.x, lp.y) > 10) {
    lp = new Particle(mouseX, mouseY);
    spots.add(lp);
  }
}
