# SEQUENCE

### Goal

Heavy lifting with **Loops and Arrays**. Let the computer repeat itself so you don't have to.

Bonus: randomness, more geometry.

### Path

The language of **Loops**: `for` and `while`

```
for (int counter = 0; counter < 10; counter++) {
    println(counter);
}
```

```
int counter = 0;
while (counter < 10) {
    println(counter);
    counter++;
}
```

Demos:

- Noise Bars (`for`, `random`)
- Distance Dots (`for`, `dist`, `map`)

---

**Arrays**! Lists of data.

```
float[] numbers;
// or
float[] numbers = { 0.1, 0.2, 0.3, 0.4, 0.5 };
// or
float[] numbers = new float[5];

// assigment
numbers[1] = 0.2;

// usage
float number = numbers[1];
```

Demos:

- Splatter Painter (`color[]`)
- Spelling Test (`String[]`, font creation & `loadFont`)
- Wandering Stars (`float[]`, random walk)

---

**BONUS**: Geometry

Demos:

- Wiggle Circle (`for`, `beginShape` etc., `noise`, polar to rectangular)
- Rotating Lines (`pushMatrix` etc., `saveFrame`)

