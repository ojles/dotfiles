layout=$(echo -e "Monitor\nLaptop\nDual\nManual selection\n" \
    | dmenu -i -fn Monospace-10 -p "Choose screen configuration:")
echo "wassap '$layout'"

case "$layout" in
    "Monitor")
        xrandr --output HDMI1 --mode 1920x1080 --pos 0x0 --rotate normal \
               --output eDP1 --off \
               --output VIRTUAL1 --off
        ;;

    "Laptop")
        xrandr --output HDMI1 --off \
               --output eDP1 --primary --mode 1366x768 --pos 0x0 --rotate normal \
               --output VIRTUAL1 --off
        ;;

    "Dual")
        xrandr --output HDMI1 --primary --mode 1920x1080 --pos 1366x0 --rotate normal \
            --output eDP1 --mode 1366x768 --pos 0x312 --rotate normal \
            --output VIRTUAL1 --off
        ;;

    "Manual selection")
        arandr
        ;;

    *)
        exit 0
        ;;
esac
