float y = 0;
float x = 0;
float dy = 2;
String letters = "abcdefghkmnopqrstuvwxyz01234567890!@#$%^&*()-=':/.<>?[]{}";

void setup() {
  size(400, 600);
  background(0);
  x = random(width);
  textSize(24);
}

int fc = 0;
char letter;

void draw() {
  fill(0, 5);
  rect(0, 0, width, height);

  fill(#93FF52);
  if (fc == 0) {
    int string_length = letters.length();
    float random_val = random(string_length);
    int char_index = floor(random_val);
    letter = letters.charAt(char_index);
    text(letter, x, y);
  }
  
  fc += 1;
  if (fc > 8) {
    fc = 0;
  }
  
  
  y = y + dy;
  if (y > height) {
    y = 0;
    x = random(width);
    textSize(random(16, 28));
  }
}
