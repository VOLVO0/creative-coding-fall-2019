import java.util.Date;

void setup() {
  size(1024, 768);
  colorMode(HSB);
  noFill();
  noLoop();
}

void draw() {
  background(0x11);
  int t = millis();
  for (int n=0; n < width*2; n++) {
    stroke(color((n * 0.1) % 360, 100, 100, 75));
    ellipse(
      n/2, 
      height, 
      noise((t + n) * 0.02) * 30, 
      noise((t + n) * 0.02) * height
      );
  }
  saveFrame(Long.toString(new Date().getTime()) + ".png");
  exit();
}
