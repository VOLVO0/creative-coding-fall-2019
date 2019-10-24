Animation dancer;

float hdw, hdh;

void setup() {
  size(960, 640);
  dancer = new Animation("frame_", 10, 30);
  hdw = dancer.getWidth() /2;
  hdh = dancer.getHeight() /2;
}

void draw() {
  background(255);
  dancer.display(width/2 - hdw, height/2 - hdh); 
  dancer.delay = int(map(mouseX, 0, width, 8, 300));
}
