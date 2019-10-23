import de.looksgood.ani.*;
import de.looksgood.ani.easing.*;

class Cell {
  
  float x,y;
  float delay;
  
  Cell(float x, float y, float delay) {
    this.x = x;
    this.y = y;
    this.delay = delay;
  }
  
  void move(float mx, float my) {
    // Ani.to(object, duration, delay, variable name, target position, easing);
    Ani.to(this, 1.0, delay, "x", mx, Ani.CUBIC_IN_OUT);
    Ani.to(this, 1.0, delay, "y", my, Ani.CUBIC_IN_OUT);
  }
  
  void draw(Cell other) {
    //fill(0, 200, 0);
    //ellipse(x, y, 20, 20);
    stroke(0, 200, 0);
    strokeWeight(12);
    line(x, y, other.x, other.y);
  }
}
