ArrayList<Amoeba> as;
Amoeba last;
boolean drawing = false;

void setup() {
  size(800, 800);
  as = new ArrayList<Amoeba>();
  
  colorMode(HSB, 360, 100, 100);
  strokeWeight(8);
}

void draw() {
  background(0);
  
  if (drawing && last != null) {
    last.add(mouseX, mouseY);
  }
      
  for (Amoeba a : as) {
    a.update();
    a.display();
  }
  
  for (int n = as.size() - 1; n > 0; n--) {
    Amoeba a = as.get(n);
    if (a.dead()) {
      as.remove(n);
    }
  }
}

int step = 0;
void mousePressed() {
  if (!drawing) {
    drawing = true;
    last = new Amoeba();
    as.add(last);
  }
}

void mouseReleased() {
  drawing = false;
  last.finish();
  last = null;
}
