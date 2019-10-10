/* 
16:9 ratios (or 1.777777778:1)

Pick a width for your sketch, then 
multiply by 9 and divide by 16 to get 
a height.

For example:

  float width = 1600;
  float height = (width * 9) / 16;
  println(width, "x", height);
  // prints out "1600 x 900" to the console

Valid sizes include:

  1920 x 1080
  1800 x 1012
  1600 x 900
  1200 x 675
  1080 x 607
  1000 x 562
  900 x 506
  800 x 450
  640 x 360
  480 x 270
 
in void setup(), pick one of:
  
  size(1920, 1080);
  size(1800, 1012);
  size(1600, 900);
  size(1200, 675);
  size(1080, 607);
  size(1000, 562);
  size(900, 506);
  size(800, 450);
  size(640, 360);
  size(480, 270);

*/

int[] widths = {
  1920, 
  1800, 
  1600, 
  1200,
  1080,
  1000,
  900,
  800,
  640,
  480
};

for (int w : widths) {
  println(w, "x", floor((w * 9) / 16.0));
}

/* 
void setup() {
  size(1920, 1080); // 1080p
}

void draw() {
} 
*/
