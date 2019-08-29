import java.util.Date;

void setup() {
  size(1024, 768);
  colorMode(HSB);
  noFill();
  // noLoop();
}

void draw() {
  background(0x11);
  // int t = millis();
  int t = frameCount;
  for (int n=0; n < width; n++) {
    stroke(color((n * 0.1) % 360, 100, 100, 75));
    ellipse(
      n, 
      height, 
      noise(n * 0.02) * 30, 
      noise(t * 0.01, n * 0.02) * height
      );
  }
  // saveFrame(Long.toString(new Date().getTime()) + ".png");
  saveFrame(String.format("anim-%03d.png", frameCount));
  
  // println();
  if (frameCount > (24 * 3)) exit();
}
