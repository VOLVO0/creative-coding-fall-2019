float y = 0;

void setup() {   
  size(800, 800);
  frameRate(30);
  colorMode(HSB, 360, 100, 100);
  noStroke();
}

void draw() {
  float step = width/60;

  fill((frameCount * 17) % 360, 100, 100);

  rect((frameCount % 60) * step, y, step, step);

  if (frameCount % 60 == 0) {
    y = y + step;
  }
}
