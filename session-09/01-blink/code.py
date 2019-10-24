# Circuit Playground digitalio example

import time
import board
import digitalio

led = digitalio.DigitalInOut(board.D13)
led.switch_to_output()

while True:
    led.value = not led.value

    time.sleep(1)

