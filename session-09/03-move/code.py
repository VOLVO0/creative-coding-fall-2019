from adafruit_circuitplayground.express import cpx

# A helper function for mapping a value from one range onto
# another. Works just like Processing's `map` function.
#           value, from_min, from_max, to_min,    to_max
def lin_map(value, left_min, left_max, right_min, right_max):
    """maps a value from one range onto another"""
    # Figure out how 'wide' each range is
    left_span = left_max - left_min
    right_span = right_max - right_min

    # Convert the left range into a 0-1 range (float)
    value_scaled = float(value - left_min) / float(left_span)

    # Convert the 0-1 range into a value in the right range.
    return right_min + (value_scaled * right_span)

# A helper function for blending between two color values
# in the form (R, G, B)
#   c1: color 1
#   c2: color 2
#   amt: the amount to blend from 0 to 1.0
def lerp_color(c1, c2, amt):
    from_a = [ c / 255.0 for c in c1 ]
    to_a =   [ c / 255.0 for c in c2 ]

    amt = max(min(amt, 1.0), 0.0)
    lerp = lambda start, stop, amt: (1.0 * amt) * (stop - start) + start

    maxes = [ 255, 255, 255 ]

    return [
        int(lerp(from_a[i], to_a[i], amt) * maxes[i]) for i in range(len(from_a))
    ]

blue = (0, 0, 255)
red =  (255, 0, 0)

while True:

    x, y, z = cpx.acceleration
    print((x, y, z))  # plotable values

    c = lerp_color(red, blue, lin_map(z, -10, 10, 0, 1.0))
    cpx.pixels.fill(c)

