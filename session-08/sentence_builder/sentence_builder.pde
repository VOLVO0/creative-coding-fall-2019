// GOAL:
// to open up a data file and use it
// file: word-types.json

JSONArray adjectives;
JSONArray nouns;
JSONArray moods;

void setup() {
  size(1200, 494);
  
  JSONObject words = loadJSONObject("word-types.json");
  println(words);
  
  JSONArray spooky = words.getJSONArray("spooky");
  println(spooky);
  
  adjectives = words.getJSONArray("adjective");
  nouns = words.getJSONArray("noun");
  moods = words.getJSONArray("mood");
  
  textSize(48);
  textAlign(CENTER, CENTER);
  
  frameRate(1);
}

void draw() {
  background(0);
  
  // i want build a sentence
  String adjective = pick(adjectives);
  String noun = pick(nouns);
  String mood = pick(moods);
  
  String sentence = "This is my " + adjective + " " + noun + ", it makes me " + mood;
  
  text(sentence, width/2, height/2);
}

String pick(JSONArray list) {
  int index = int(random(list.size()));
  return  list.getString(index);
}
