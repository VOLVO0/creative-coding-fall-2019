Branch[] trees;
int MAX_LEVEL = 8;
float MAX_TIME = 200; 

void setup() {
  size(800, 800);
  smooth(8);
  generate();
}

void keyReleased() {
  generate();
}

void generate() {
  float rot = 0;
  trees = new Branch[4];
  for (int n=0; n<4; n++) {
    trees[n] = new Branch(rot, 0);
    rot += HALF_PI;
  }
}
void draw() {
  background(0);

  translate(width/2, height/2);
  
  for (Branch tree : trees) {
    tree.update();
    tree.display();
  }
}
