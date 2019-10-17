JSONObject words;
JSONArray nouns;
JSONArray adjectives;
JSONArray moods;

void setup() {
  size(800, 494);
  background(0);
  
  /* 
  {
    "noun": [],
    "adjective": [],
    "spooky": [],
    ...
  }
  */
  words = loadJSONObject("word-types.json");
  nouns = words.getJSONArray("noun");
  adjectives = words.getJSONArray("adjective");
  moods = words.getJSONArray("mood");
  
  textSize(48);
  textAlign(CENTER, CENTER);
  smooth();
  
  frameRate(1);
}

void draw() {
  background(0);
  String sentence = "Look at my " + pick(adjectives) + " " + pick(nouns) + ",\nit makes me " + pick(moods);
  text(sentence, width/2, height/2);
}

String pick(JSONArray list) {
  int len = list.size();
  return list.getString(floor(random(len)));
}
