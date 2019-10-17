import websockets.*; // Sketch -> Import Library... -> Add Library... -> "websocket"

WebsocketClient wsc;
int PING_TIMEOUT = 15000;
long lastPing;
String message;
int values[] = new int[0];

float ROWS = 8;
float COLS = 6;
float hstep, vstep;

void setup(){
  size(600, 800);
  
  hstep = width / COLS;
  vstep = height / ROWS;
  
  background(0);
  fill(51);
  message = "";
  
  noStroke();
  
  // initiate the websocket connection
  wsc = new WebsocketClient(this, "ws://micavibe.com/streaming");
  lastPing = millis();
}

color minmove = #000000;
color maxmove = #f022ff;

void draw(){
  background(0);
  fill(255);
  
  // just waiting for messages
  if (millis() - lastPing > PING_TIMEOUT) {
    println("ping");
    wsc.sendMessage("ping");
    lastPing = millis();
  }
  
  if (values.length == 48) {
    for (int y=0; y < ROWS; y++) {
      for (int x=0; x < COLS; x++) {
        int val = values[int(y * COLS + x)];
        color c = lerpColor(minmove, maxmove, norm(val, 0, 128));
        fill(c);
        rect(x * hstep, y * vstep, hstep, vstep);
        fill(255);
        text(val, x * hstep, y * vstep + 14);
      }
    }
  }
  
}

// This is an event like onMouseClicked. If you chose to use it, 
// it will be executed whenever the server sends a message
//
// !! You cannot draw from inside this function !!
void webSocketEvent(String msg){
  message = msg;
  
  try {
    JSONObject dataObj = parseJSONObject(message);
    if (dataObj.getString("key").startsWith("split-motion")) {
      String string_values[] = split(dataObj.getString("value"), " ");
      values = new int[string_values.length];
      
      for (int i=0; i < string_values.length; i++) {
        values[i] = int(string_values[i]);
      }
      
      println("got", values.length, "values");
    }
  } catch(Exception ex) {
    println("  failed to parse message:", ex);
  }
}
