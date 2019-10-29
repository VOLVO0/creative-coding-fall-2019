// This sketch demonstrates the use of map() to scale 
// a larger value (mouseX) onto a smaller range.

void setup() {
  size(400, 400);
  stroke(255);
  fill(255);
}

void draw() {
  background(0);
  
  // top object, draw exactly where the mouse is 
  ellipse(mouseX, 40, 10, 10);
  text(mouseX, 10, 40);
  
  float scaled;
  
  // 3/4 of the screen
  scaled = map(mouseX, 0, width, 0, width * 0.75); 
  ellipse(scaled, 80, 10, 10);  
  text(scaled, 10, 80);
   
  // 1/2 the screen
  scaled = map(mouseX, 0, width, 0, width * 0.5); 
  ellipse(scaled, 120, 10, 10);  
  text(scaled, 10, 120);
  
  // 1/4 of the screen
  scaled = map(mouseX, 0, width, 0, width * 0.25); 
  ellipse(scaled, 160, 10, 10);  
  text(scaled, 10, 160);
  
  // splitting a range into steps
  int steps = 10;
  scaled = floor(map(mouseX, 0, width, 0, steps)); 
  ellipse(scaled * (width / steps), 200, 10, 10); 
  text(scaled, 10, 200);
  
  steps = 7;
  scaled = floor(map(mouseX, 0, width, 0, steps)); 
  ellipse(scaled * (width / steps), 240, 10, 10); 
  text(scaled, 10, 240);
  
  steps = 4;
  scaled = floor(map(mouseX, 0, width, 0, steps)); 
  ellipse(scaled * (width / steps), 280, 10, 10); 
  text(scaled, 10, 280);
      
  steps = 2;
  scaled = floor(map(mouseX, 0, width, 0, steps)); 
  ellipse(scaled * (width / steps), 320, 10, 10); 
  text(scaled, 10, 320);
}
