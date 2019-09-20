
class Thing {
  float x,y;
  
  Thing() {
    x = random(400, 700);
    y = random(height);
  }
  
  void display(float cx, float cy) {   
    fill(200);
    rect(x - cx, y - cy, 20, 20);
  }
}

PImage img;
int TCOUNT = 200;
Thing t[];

float cam_x = 0;
float cam_y = 0;

void setup () {
  size(500, 500);
  t = new Thing[TCOUNT];
  for (int i=0; i < TCOUNT; i++) {
    t[i] = new Thing();
  }
  
  img = loadImage("screen.jpg");
}

void draw() {
  
  image(img, 0 - cam_x, 0 - cam_y);

  // world objects
  for (Thing _t : t) {
    _t.display(cam_x, cam_y);
  }
  
  //character
  fill(100, 200, 75);
  ellipse(width/2, height/2, 10, 10);
}

void keyPressed() {
  if (keyCode == UP) {
    cam_y -= 4;
  } else if (keyCode == DOWN) {
    cam_y += 4;
  } else if (keyCode == RIGHT) {
    cam_x += 4;
  } else if (keyCode == LEFT) {
    cam_x -= 4;
  }
}
