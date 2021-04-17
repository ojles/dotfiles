#!/bin/sh

event=$1
type=$3

case "$event $type" in
	'XIDeviceEnabled XISlaveKeyboard')
		dir=$(dirname ${BASH_SOURCE[0]})
		. $dir/keyboard.sh
esac
