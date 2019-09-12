String[] words = {
  "Bumfuzzle", "Cattywampus", "Gardyloo", "Taradiddle", "Snickersnee",
  "Widdershins", "Collywobbles", "Gubbins", "Abibliophobia", "Bumbershoot",
  "Lollygag", "Flibbertigibbet", "Malarkey", "Pandiculation", "Sialoquent",
  "Wabbit", "Snollygoster", "Erinaceous", "Bibble", "Impignorate",
  "Nudiustertian", "Quire", "Ratoon", "Yarborough", "Xertz", "Zoanthropy",
  "Pauciloquent", "Bloviate", "Borborygm", "Brouhaha", "Absquatulate",
  "Comeuppance", "Donnybrook", "Nincompoop"
};

void setup() {
  size(600, 200);
  frameRate(1);
  PFont font = loadFont("IowanOldStyle-Black-64.vlw");
  textFont(font);
}

void draw() {
  background(0);
  textSize(64);
  // random int value 0 or greater, less than words.length
  int index = int(random(words.length));
  String word = words[index];
  textAlign(CENTER);
  text(word, width/2, height/2);
}
