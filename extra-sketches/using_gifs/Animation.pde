// Class for animating a sequence of GIFs from 
// "Animated Sprite (Shifty + Teddy)" by James Paterson

class Animation {
  PImage[] images;
  int imageCount;
  int frame;
  long lframe;
  int delay;
  
  Animation(String imagePrefix, int count, int delayms) {
    imageCount = count;
    images = new PImage[imageCount];
    
    delay = delayms;

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + nf(i, 2) + ".gif";
      images[i] = loadImage(filename);
    }
  }

  void display(float xpos, float ypos) {
    long now = millis();
    if (millis() - lframe > delay) {
      frame = (frame+1) % imageCount;
      lframe = now;
    }
    
    image(images[frame], xpos, ypos);
  }
  
  int getWidth() {
    return images[0].width;
  }
    
  int getHeight() {
    return images[0].height;
  }
}
