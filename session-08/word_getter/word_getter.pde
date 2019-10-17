JSONObject json;
String word;

void setup() {
  size(800, 494);
  
  //
  // try: 
  //   - https://mica-ia1.glitch.me/word
  //   - https://mica-ia1.glitch.me/word-sync
  //   - https://mica-ia1.glitch.me/word/adjective
  //   - https://mica-ia1.glitch.me/word/noun
  //   - https://mica-ia1.glitch.me/word/boyname
  //   - https://mica-ia1.glitch.me/word/girlname
  //   - https://mica-ia1.glitch.me/word/mood
  //   - https://mica-ia1.glitch.me/word/spooky
  //
  // visit https://mica-ia1.glitch.me to make a copy of the word
  // server if you want to use it in a sketch.
  // 
  json = loadJSONObject("https://mica-ia1.glitch.me/word-sync");
  word = json.getString("word");
  
  textSize(100);
  textAlign(CENTER, CENTER);
  
  
}

void draw() {
  background(0);
  text(word, width/2, height/2);
}
