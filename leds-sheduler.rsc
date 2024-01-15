/system scheduler
add interval=1d name=daily_led_off on-event="/system/leds/settings/set all-leds-off immediate" start-date=jan/01/1970 start-time=19:00:00
add interval=1d name=daily_led_on on-event="/system/leds/settings/set all-leds-off never" start-date=jan/01/1970 start-time=08:00:00
