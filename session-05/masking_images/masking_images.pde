/* 
 Photo by Gerson Repreza on Unsplash
 https://unsplash.com/photos/Mc-bejHZ9po
 */

PImage img;
boolean running;

void setup() {
  size(800, 600);
  img = loadImage("action.jpg");
}

void draw() {
  // background(0);
  
  PGraphics myMask = createGraphics(img.width, img.height);
  myMask.beginDraw();
  
  myMask.noStroke();
  myMask.background(0);
  myMask.fill(255);
  myMask.ellipse(mouseX, mouseY, 20, 20);
  
  myMask.endDraw();
  
  // image(myMask, 0, 0);
  
  img.mask(myMask);
  image(img, 0, 0);
}
