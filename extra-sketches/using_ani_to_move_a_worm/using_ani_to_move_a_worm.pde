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
