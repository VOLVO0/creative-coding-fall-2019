int fakeFrameCount = 10;

void setup() {
  size(800, 800);
}

void draw() {
  ellipse(mouseX, mouseY, fakeFrameCount, fakeFrameCount);
  fakeFrameCount = fakeFrameCount + 2;
  if (mousePressed) {
    fakeFrameCount = 0;
  }
}
