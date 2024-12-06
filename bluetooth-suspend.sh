#!/bin/bash
case $1 in
	pre)
	# executed before suspend, hibernate, etc.
	rfkill block bluetooth
	;;
	post)
	# executed on wake, resume, etc.
	rfkill unblock bluetooth
	;;
esac
