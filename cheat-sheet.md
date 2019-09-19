`{ }` - curly braces

`[ ]` - square braces

`( )` - parenthesis

`*` - multiplication

`/` - division

`%` - modulus: divide and give me the remainder

`&&` - logical AND

`||` - logical OR

`==` - logical EQUALS (comparison)

`=` - set value

`width`, `height` - current sketch width or height value

`mouseX`, `mouseY` - current mouse position

`//` - comment, Processing ignores everything after the slashes

Creating and setting variables:

```java
float x;     // create without setting
float x = 1; // create and set

float x;     // create and set later...

void setup() {
  x = 1;     // ... like inside setup() or draw()
}
```

Incrementing a number:

```java
x = x + 1; // long
x += 1;    // medium
x++;       // short (count by 1 only)
```

### Functions

Creating a function:

```java
// returnType name(arguments) {
// }

void drawShape() {
  rect(10, 10, 10, 10);
}

void drawShapeAtPlace(int x, int y) {
  rect(x, y, 10, 10);
}

int rollDie() {
  return 1 + int(random(6));
}

boolean flipCoin() {
  return random() > 0.5;
}
```

Using functions:

```java
void draw() {
  int count = rollDie();

  for (int x = 0; x < count; x++) {
    drawShapeAtPlace(x * 40, 10);
  }
}
```

### Changing Numbers

Reciprocating (back and forth):

```
int x = 0;
int dx = 1;

void draw() {
  background(0);
  text(x, width/2, height/2);
  if (x < 0 || x > width) {
    dx = dx * -1;
  }
}
```

Cycling (counting up to a maximum number):

```
int x = 0;
int MAX = 100;

void draw() {
  background(0);
  text(x, width/2, height/2);
  x = (x + 1) % MAX;
}
```

