from i3pystatus import Status

status = Status(standalone=True, click_events=True)

foreground="#bbbbbb"
green="#00bb00"
red="#bb0000"
yellow="#bbbb00"

# Displays clock like this:
# Tue 30 Jul 11:59:46 PM
status.register("clock",
    format="%a %-d %b %X ",
    color=foreground)

# Shows battery information 
status.register("battery",
    interval=5,
    # format="BAT: [{status} ]{percentage_design:.2f}%",
    format="BAT: {percentage_design:.2f}%",
    not_present_text="",
    alert=True,
    alert_percentage=15,
    status={"DPL": "dpl", "CHR": "chr", "DIS": "dis", "FULL": ""},
    color=foreground,
    full_color=foreground,
    charging_color=green,
    critical_color=red)

# Shows received bytes
# status.register("network",
    # interface="enp3s0", # eth0, enp3s0, etc.
    ##next_if_down=True,
    # format_up="↓ {bytes_recv}KB/s",
    # format_down="",
    # dynamic_color=False,
    # color_up=green,
    # color_down=red)

# Shows sent bytes
# status.register("network",
    # interface="enp3s0", # eth0, enp3s0, etc.
    ##next_if_down=True,
    # format_up="↑ {bytes_sent}KB/s",
    # format_down="",
    # dynamic_color=False,
    # color_up=green,
    # color_down=red)

# Shows the address and up/down state of eth0. If it is up the address is shown in
# green (the default value of color_up) and the CIDR-address is shown
# (i.e. 10.10.10.42/24).
# If it's down just the interface name (eth0) will be displayed in red
# (defaults of format_down and color_down)
# Note: the network module requires PyPI package netifaces
status.register("network",
    interface="enp3s0", # eth0, enp3s0, etc.
    # next_if_down=True,
    format_up="ETH: {v4cidr}",
    format_down="ETH: down",
    auto_units=True,
    color_up=green,
    color_down=red)

# Note: requires both netifaces and basiciw (for essid and quality)
status.register("network",
    interface="wlp3s0", # wlan0, wlp3s0, etc.
    # next_if_down=True,
    #detached_down=False,
    format_up="WLN: {essid} {quality:03.0f}%",
    format_down="WLN: down",
    color_up=green,
    color_down=red)


# Shows pulseaudio default sink volume
# Note: requires libpulseaudio from PyPI
status.register("pulseaudio",
    format="VOL: {volume}",
    format_muted="VOL: muted",
    color_unmuted=foreground,
    color_muted=red)

# Shows disk usage of /
# Format:
# 42/128G [86G]
status.register("disk",
    path="/",
    format="SSD1: {used}/{total}G [{avail}G]",
    format_not_mounted="/: unmounted",
    color_not_mounted=yellow,
    critical_limit=10,
    critical_color=red,
    color=foreground)

# Shows disk usage of /media/vandito/home
# Format:
# 42/128G [86G]
status.register("disk",
    path="/media/vandito/home",
    format="ssd {used}/{total}G [{avail}G]",
    # format_not_mounted="/media/vandito/home: UNMOUNTED",
    format_not_mounted="",
    color_not_mounted=yellow,
    critical_limit=1,
    critical_color=red,
    color=foreground)

# Shows SWAP usage %
status.register("swap",
    format="swp {percent_used}%",
    warn_percentage=50,
    alert_percentage=80,
    color=foreground,
    warn_color=yellow,
    alert_color=red)

# Shows RAM usage %
status.register("mem",
    format="ram {percent_used_mem}%",
    warn_percentage=80,
    alert_percentage=90,
    color=foreground,
    warn_color=yellow,
    alert_color=red)

# Shows CPU temperature
status.register("temp",
    format="tmp {temp:.0f}°C",
    alert_temp=80,
    alert_color=red,
    color=foreground)

# Shows CPU usage %
status.register("cpu_usage",
    format="cpu {usage:02}%",
    color=foreground)

# Shows CPU usage graph
status.register("cpu_usage_graph",
    format="{cpu_graph}",
    graph_style="braille-fill",
    graph_width=30)

# Shows cpu usage bar per core
status.register("cpu_usage_bar",
    format="{usage_bar_cpu0} {usage_bar_cpu1} {usage_bar_cpu2} {usage_bar_cpu3}",
    bar_type="vertical")

status.run()
