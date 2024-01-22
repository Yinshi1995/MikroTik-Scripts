:local idleTimeout 5m  ; Inactivity time (e.g., 5 minutes)
:local interfaceList "bridge" ; List of interfaces you want to monitor

:foreach interface in=[:toarray $interfaceList] do={
  :local devices [/ip neighbor find interface=$interface]
  
  :foreach device in=$devices do={
    :local lastSeen [/ip neighbor get $device last-seen]
    :local currentTime [/system clock get time]

    :local idleTime [:parse [/system script get idleTime value-name=uptime]]

    :if (($currentTime - $lastSeen) > $idleTimeout) do={
      :log info "Disconnecting device with IP address [:toip [/ip neighbor get $device address]] due to inactivity."
      /ip neighbor remove $device
      /log info ("Device with IP address [:toip [/ip neighbor get $device address]] disconnected due to inactivity.")
    }
  }
}
