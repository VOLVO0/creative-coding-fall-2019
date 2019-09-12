PImage photo;

void setup() {
  size(200, 287);
  photo = loadImage("287.jpeg");
}

void draw() {
  background(255);
  image(photo, 0, 0);
  
  int step = 5;
  
  strokeWeight(step);
   
  for (int x=0; x < width; x += step) {
    step = floor(random(2, 10));
    strokeWeight(step);
    
    // pick a random height value
    int y = floor(random(0, height));
    
    // get that pixel's color
    color c = photo.get(x, y);
    
    stroke(c);
    line(x, 0, x, y); // vertical
    line(0, y, x, y); // horizontal
  }
  
  noLoop();
}

void keyPressed() {
  loop();
}
