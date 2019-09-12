`{ }` - curly braces

`[ ]` - square braces

`( )` - parenthesis

`*` - multiplication

`/` - division

`%` - modulus: divide and give me the remainder

`&&` - logical AND

`||` - logical OR

`width`, `height` - current sketch width or height value

`mouseX`, `mouseY` - current mouse position

`//` - comment, Processing ignores everything after the slashes

Creating and setting variables:

```
float x;     // create without setting
float x = 1; // create and set
float x;
x = 1;       // create and set later
```

Incrementing a number:

```
x = x + 1; // long
x += 1;    // medium
x++;       // short (count by 1 only)
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

