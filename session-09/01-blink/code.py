# Circuit Playground digitalio example

import time
from adafruit_circuitplayground.express import cpx

blink = True
while True:
    if blink:
        cpx.pixels.fill((255, 255, 255))
        blink = False
    else:
        cpx.pixels.fill((0, 0, 0))
        blink = True

    time.sleep(1)

