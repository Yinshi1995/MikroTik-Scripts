:local trafficLimit 10000000 ;# Установите лимит трафика в байтах (например, 10 МБ)

:if ([/log find where message~"TRAFFIC_MONITOR"] = "") do={
    :log info "No traffic found"
} else={
    :local totalTraffic 0
    :foreach logEntry in=[/log find where message~"TRAFFIC_MONITOR"] do={
        :local traffic [:tonum [get $logEntry message]]
        :set totalTraffic ($totalTraffic + $traffic)
    }

    :if ($totalTraffic > $trafficLimit) do={
        :log warning "Traffic limit exceeded! Total traffic: $totalTraffic bytes"
        /tool e-mail send to="your@email.com" subject="Traffic Limit Exceeded" body="Total traffic exceeded $trafficLimit bytes. Current total traffic: $totalTraffic bytes."
    }
}
