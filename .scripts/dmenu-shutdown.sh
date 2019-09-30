shutdown_options="Now\nSuspend\nExit i3\n"

if [ -e '/run/systemd/shutdown/scheduled' ]; then
    shutdown_options="Cancel Previous\n$shutdown_options"
else
    shutdown_options="Delay\n$shutdown_options"
fi

option=$(echo -e "$shutdown_options" \
    | dmenu -i -fn Monospace-10 -p "Shutdown option:")

case "$option" in
    "Delay")
        shutdown +20
        notify-send -t 5000 -u critical "Important!" \
            "System will go down at T+20 minutes"
        ;;

    "Cancel Previous")
        shutdown -c
        notify-send -t 4000 "Notification" "Canceled last shutdown request"
        ;;

    "Now")
        shutdown now
        ;;

    "Suspend")
        systemctl suspend
        ;;

    "Exit i3")
        i3-msg exit
        ;;

    *)
        exit 0
        ;;
esac
