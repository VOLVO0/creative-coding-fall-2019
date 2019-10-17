PImage heads[] = {
  loadImage("a.jpeg"), loadImage("b.jpeg")
};

PImage torsos[] = {
  loadImage("c.jpeg"), loadImage("d.jpeg")
};

PImage legs[] = {
  loadImage("e.jpeg"), loadImage("f.jpeg")
};

ArrayList<PImage[]> alltypes = new ArrayList<PImage[]>();

for (PImage head : heads) {
  for (PImage body : torsos) {
    for (PImage leg : legs) {
      alltypes.add(new PImage[]{ head, body, leg });
    }
  }
}

size(400, 800);

PImage creature[] = alltypes.get(int(random(alltypes.size())));

image(creature[0], 0, 0);
image(creature[1], 0, height * .3);
image(creature[2], 0, height * .6);
