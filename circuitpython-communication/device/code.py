# pylint: skip-file
import time
from adafruit_circuitplayground.express import cpx

history = []
HISTORY_LENGTH = 25 # try changing from 1 to ?

def avg(arr, n):
    return sum(element[n] for element in arr) / len(arr)

def readsmooth():
    global history
    history.append(cpx.acceleration)

    if len(history) > HISTORY_LENGTH:
        history = history[-HISTORY_LENGTH:]

    return (avg(history, 0), avg(history, 1), avg(history, 2))

count = 0
blink = False
while True:
    count += 1

    x, y, z = readsmooth()
    print("%f %f %f" % (x, y, z))

    if blink:
        cpx.pixels.fill((0, 0, 0))
        blink = False

    if count % 300 == 0:
        cpx.pixels[0] = (0, 0, 10)
        blink = True

