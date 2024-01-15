/system scheduler
add interval=1d name=daily_led_off on-event="/system leds set 0 led-type=off" start-date=jan/01/1970 start-time=19:00:00
add interval=1d name=daily_led_on on-event="/system leds set 0 led-type=auto" start-date=jan/01/1970 start-time=08:00:00
