color[] choices = {
  #ffaa09,
  #0face3,
  #dab0be,
  #99cafe,
  #72bad0,
};

void setup() {
  size(400, 400);
  noStroke();
  background(0);
}

void draw() {
  for (int i=0; i<30; i++) {
    fill(choices[i % choices.length]);
    ellipse(random(width), random(height), 30, 30);
  }
  
  if (keyPressed) {
    noLoop();
  }
}
