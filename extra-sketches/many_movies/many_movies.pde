
import processing.video.*;

Movie movies[];

void setup() {
  size(800, 600);
  
  movies = new Movie[8];
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
  fill(255);
  
  int area = int(map(mouseX, 0, width, 0, 8));
  
  Movie movie = movies[area];
  movie.play();
  
  text(area, 10, 10);
  image(movie, 100, 50, 600, 500);
}
