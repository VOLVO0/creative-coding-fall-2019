function setup() {
  createCanvas(500, 500);
  noStroke();
  background(0);
  rectMode(CENTER);
}


function draw() {
  background(0);
  stroke(255);
  noFill();

  strokeWeight(2);
  for (var y=0; y < 20; y++) {
    for (var x=0; x < 20; x++) {
      var cx = 30 * x;
      var cy = 30 * y;
      
      var d = dist(cx, cy, mouseX, mouseY);
      var r = map(d, 0, width, 0, TWO_PI);
      
      push();
      translate(cx, cy);
      rotate(r);
      line(0, 0, 0, 20);
      pop();
    }
  }
}
