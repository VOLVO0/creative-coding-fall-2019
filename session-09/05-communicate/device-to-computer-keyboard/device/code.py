import time
import board
import digitalio
from adafruit_hid.keyboard import Keyboard
from adafruit_hid.keyboard_layout_us import KeyboardLayoutUS
from adafruit_hid.keycode import Keycode

button = digitalio.DigitalInOut(board.BUTTON_A)
button.switch_to_input(pull=digitalio.Pull.DOWN)

button2 = digitalio.DigitalInOut(board.BUTTON_B)
button2.switch_to_input(pull=digitalio.Pull.DOWN)

led = digitalio.DigitalInOut(board.D13)
led.direction = digitalio.Direction.OUTPUT

time.sleep(1)
kbd = Keyboard()
layout = KeyboardLayoutUS(kbd)

while True:
    # check each button
    # when pressed, the LED will light up,
    # when released, the keycode or string will be sent
    # this prevents rapid-fire repeats!
    if button.value:  # pressed?
        print("Button A Pressed")

        # turn on the LED
        led.value = True

        while button.value:
            pass  # wait for it to be released!

        # type the keycode or string
        layout.write("a")

        # turn off the LED
        led.value = False

    if button2.value:
        print("Button B Pressed")

        # turn on the LED
        led.value = True

        while button2.value:
            pass  # wait for it to be released!

        # type the keycode or string
        layout.write("b")

        # turn off the LED
        led.value = False

    time.sleep(0.01)

