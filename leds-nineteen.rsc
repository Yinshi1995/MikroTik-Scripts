/system script
add name=daily_led_off policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive source={
  :local current_time [:time get [/system clock get time]]
  :local current_hour [:pick $current_time 0 2]
  
  :if ($current_hour >= 19) do={
    /system leds set 0 led-type=off
  }
}

/system script
add name=daily_led_on policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive source={
  :local current_time [:time get [/system clock get time]]
  :local current_hour [:pick $current_time 0 2]
  
  :if ($current_hour >= 8) do={
    /system leds set 0 led-type=auto
  }
}
