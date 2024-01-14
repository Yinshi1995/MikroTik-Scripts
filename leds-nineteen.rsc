/system script add name=disable_leds policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive source={
  :local current_time [:time get [/system clock get time]]
  :local current_hour [:pick $current_time 0 2]
  
  :if ($current_hour >= 19) do={
    /system leds settings set all-leds-off=immediate
  }
}

