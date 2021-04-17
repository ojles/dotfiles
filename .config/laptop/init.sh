config=~/.config/laptop

inputplug -0 -c $config/keyboard.sh &

while true; do
	xsetroot -name "$($config/statusbar.sh)"
	sleep 1s
done &

exec dwm
