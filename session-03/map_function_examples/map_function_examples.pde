void setup(){
  size(700,700);
}

void draw() {
  background(255);
  fill(0);
  float top = 0;
  float downscaled = 0;
  float us = 0;
  
  float amplification = 1.2;
  
  top = map(mouseX, 0, width, width, 0);
  downscaled = map(mouseX, 0, width, 0, 10);
  us = map(mouseX, 0, width, 0, width * amplification);
  
  // twister
  stroke(200, 0, 0);
  line(top, 0, mouseX, height); 
  text(top, top, 20);
  
  // scaled down
  stroke(0, 200, 0);
  line(downscaled, 0, downscaled, height); 
  text(downscaled, downscaled, 20);
  
  // scaled up
  stroke(0, 0, 200);
  line(us, 0, us, height); 
  text(us, us, 20);
  
  stroke(0);
  line(mouseX, 0, mouseX, mouseY);
  text(mouseX, mouseX, mouseY);
}
