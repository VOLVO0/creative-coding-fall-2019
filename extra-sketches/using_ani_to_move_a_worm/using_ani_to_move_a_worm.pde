import de.looksgood.ani.*;
import de.looksgood.ani.easing.*;

int LEN = 16;
Cell c[];

void setup() {
  size(600, 300);
  noStroke();
  Ani.init(this);

  c = new Cell[LEN];
  for (int i = 0; i < LEN; i++) {
    c[i] = new Cell(0 + i*4, height/2, i * 0.05);
  }
}

void draw() {
  background(0);
  fill(0, 200, 0);

  for (int i = 0; i < LEN; i++) {
    if (i > 0) { 
      c[i].draw(c[i - 1]);
    }
  }
}

void mouseReleased() {
  for (int i = 0; i < LEN; i++) {
    Cell cell = c[i];   
    cell.move(mouseX - (i * 3), mouseY - (i * 3));
  }
}

  /* 
   @t is the current time (or position) of the tween. This can be seconds or 
   frames, steps, seconds, ms, whatever – as long as the unit is the same 
   as is used for the total time [3].
   @b is the beginning value of the property.
   @c is the change between the beginning and destination value of the 
   property.
   @d is the total time of the tween.
   */
  float easeInOut (float t, float b, float c, float d) {
    if ((t/=d/2) < 1) return c/2*t*t*t + b;
    return c/2*((t-=2)*t*t + 2) + b;
  }
