String[] words = {
  "MENU:", 
  "potato",
  "chicken",
  "pop tarts",
  "pizza",
  "salad",
  "cookies",
  "smoothie"
};

void setup() {
  size(600, 600);
  frameRate(1);
  
  PFont mono;
  mono = loadFont("Futura-Bold-64.vlw");
  textFont(mono);
  textSize(58);
  textAlign(CENTER);
}

int w = 0;

void draw() {
  background(51);
  
  text(words[w], width/2, height/2);
  //w = int(map(mouseX, 0, width, 0, words.length));
  w = (w + 1) % words.length;
}
