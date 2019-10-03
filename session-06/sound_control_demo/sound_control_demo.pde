// Bird sound file from: https://freesound.org/people/urupin/sounds/159609/
// Recorded by: urupin
// 
// Amplitude and FFT samples taken from GPL Licensed 
// Processing Sound library examples.
// https://github.com/processing/processing-sound

/* 
  This sketch demonstrates sound playback with rate
  control and microphone input to get sound data and
  Volume analysis and FFT analysis to get information
  about the sound data.
 */

import processing.sound.*;

SoundFile file;

String MODE = "volume"; // "freq" or "volume"
String INPUT = "file"; // "mic" or "file"

// loudness response
Amplitude loudness;
AudioIn input;

// frequency response
FFT fft;
int bands = 512;
float[] spectrum = new float[bands];

void setup() {
  size(512, 360);

  // Create a Sound renderer and an array of empty soundfiles
  if (INPUT == "file") {
    file = new SoundFile(this, "basic-birds.mp3");
    file.loop();
  } else {
    input = new AudioIn(this, 0);
    // Begin capturing the audio input
    input.start();
  }

  // Create a new Amplitude analyzer
  if (MODE == "volume") {
    loudness = new Amplitude(this);
    if (INPUT == "file") {
      loudness.input(file);
    } else {
      loudness.input(input);
    }
  } else {
    fft = new FFT(this, bands);
    if (INPUT == "file") {
      fft.input(file);
    } else {
      fft.input(input);
    }
  }
  
  textSize(30);
}

void draw() {
  float rate = map(mouseX, 0, width, 0.2, 1.4);
  
  if (INPUT == "file") 
    file.rate(rate);

  if (MODE == "volume") {
    float volume = loudness.analyze();
    int size = int(map(volume, 0, 0.5, 1, 350));
    background(125, 255, 125);
    noStroke();
    fill(255, 0, 150);
    // We draw a circle whose size is coupled to the audio analysis
    ellipse(width/2, height/2, size, size);
  } else {
    background(255);
    fft.analyze(spectrum);
    for (int i = 0; i < bands; i++) {
      // The result of the FFT is normalized
      // draw the line for frequency band i scaling it up by 5 to get more amplitude.
      line( i, height, i, height - spectrum[i]*height*5 );
    }
  }
  
  if (INPUT == "file"); {
    fill(0);  
    text(rate, 0, 28); 
  }
}
