/*
 Simple Image Glitching Processing
 datamoshing.com | 2016
 http://datamoshing.com/2016/06/16/how-to-glitch-images-using-processing-scripts/
 
 Photo by Gerson Repreza on Unsplash
 https://unsplash.com/photos/Mc-bejHZ9po
 */
 
// Topics:
//   image
//   loadImage
//   loadPixels
//   pixels
//   updatePixels
//   using randomness to trigger a behavior

// image path is relative to sketch directory
PImage img;
String imageName = "action.jpg";
boolean running;

void setup() {
  img = loadImage(imageName);

  // use only numbers (not variables) for the size() command, Processing 3
  size(800, 600);

  // load image onto surface
  image(img, 0, 0, img.width, img.height);
  
  running = true;
  
  img.loadPixels(); // load image pixels into img.pixels variable
}

color randomColor() {
  return color(
    random(255), // red part
    random(255), // green part
    random(255)  // blue part
  );
}


void draw() {
  // populate `pixels` variable so we can reset the color values 
  loadPixels();

  boolean previousPixelGlitched = false;
  color nextColor = randomColor();

  // for each column of pixels
  for (int x = 0; x < img.width; x++) {
    // for each row of pixels
    for (int y = 0; y < img.height; y++) {
      
      // get the color for the pixel at coordinates x/y
      color pixelColor = img.pixels[y + x * img.height];
      
      // Roll a 100 sided die see if you get higher than 20
      boolean chance = random(100) < 20;
      
      // if the previous pixel was glitched, there's a higher d
      // chance that the next will be glitched the same color
      boolean repeat = previousPixelGlitched == true && random(100) < 80;
        
      // 25% chance to glitch this pixel, 
      // a second 80% chance to glitch with the same 
      // color if the previous pixel was glitched
      if (chance || repeat) {
        previousPixelGlitched = true;

        // percentage to mix
        float mixPercentage = .5 + random(50)/100;

        // mix colors by random percentage of new random color
        pixels[y + x * img.height] = lerpColor(
          pixelColor, 
          nextColor, 
          mixPercentage
        );
      } else {
        // didn't glitch this pixel
        previousPixelGlitched = false;

        // choose a new random mix color
        // 0-255, red, green, blue, alpha
        nextColor = randomColor();
        pixels[y + x * img.height] = pixelColor;
      }
    }
  }

  // replace the current screen with the 
  // pixel values in `pixels`
  updatePixels();

  // apply some filters
  // https://processing.org/reference/filter_.html

  // posterize filter
  // filter(POSTERIZE, 4);

  // dilate filter
  // filter(DILATE);
}

// any key press acts like a pause button
void keyPressed() {
  if (running) {
    noLoop();
    running = false;
  } else {
    loop();
    running = true;
  }
}
