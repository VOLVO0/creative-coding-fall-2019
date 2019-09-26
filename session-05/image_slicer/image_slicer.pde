/* 
 Photo by Gerson Repreza on Unsplash
 https://unsplash.com/photos/Mc-bejHZ9po
 */

PImage img;
boolean running;

void setup() {
  size(1024, 600);
  img = loadImage("screen.jpg");
}

void draw() {
  background(0);
  int x = 0;
  int step = int(random(1, 12));
  while (x < width) {
    PImage slice = img.get(x, 0, step, height);
    image(slice, x, int(random(-mouseX, mouseX)));
    
    x += step;
    step = int(random(1, mouseY));
  }
}

// any key press acts like a pause button
void keyPressed() {
  if (running) {
    noLoop();
    running = false;
    // saveFrame("capture.jpg");
  } else {
    loop();
    running = true;
  }
}
