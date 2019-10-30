
import processing.video.*;

Movie movies[];
int NUMBER_OF_AREAS = 8;

void setup() {
  size(800, 600);
  
  movies = new Movie[NUMBER_OF_AREAS];
  movies[0] = new Movie(this, "transit.mov");
  movies[1] = new Movie(this, "transit.mov");
  movies[2] = new Movie(this, "transit.mov");
  movies[3] = new Movie(this, "transit.mov");
  movies[4] = new Movie(this, "transit.mov");
  movies[5] = new Movie(this, "transit.mov");
  movies[6] = new Movie(this, "transit.mov");
  movies[7] = new Movie(this, "transit.mov");
}

void movieEvent(Movie m) {
  m.read();
}


void draw() {
  background(0);
  fill(255);
  
  int area = int(map(mouseX, 0, width, 0, NUMBER_OF_AREAS)); //
  
  // each frame goes from 0 to width/insideFrame
  Movie movie = movies[area];
  
  int insideFrameX = mouseX - (area * width/NUMBER_OF_AREAS);
  int movieLen = getLength(movie);
  int videoFrame = int(map(insideFrameX, 0, width/NUMBER_OF_AREAS, 0, movieLen));
  
  setFrame(videoFrame, movie);
  image(movie, 100, 50, 600, 500);
  
  text(area, 10, 10);
  text(insideFrameX, area * width/8.0, 30);
  text(videoFrame, area * width/8.0, 45);
}

int getLength(Movie mov) {
  return int(mov.duration() * mov.frameRate);
}

void setFrame(int n, Movie mov) {
  mov.play();
    
  // The duration of a single frame:
  float frameDuration = 1.0 / mov.frameRate;
    
  // We move to the middle of the frame by adding 0.5:
  float where = (n + 0.5) * frameDuration; 
    
  // Taking into account border effects:
  float diff = mov.duration() - where;
  if (diff < 0) {
    where += diff - 0.25 * frameDuration;
  }
    
  mov.jump(where);
  mov.pause();  
}  
