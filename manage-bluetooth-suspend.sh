#!/bin/bash

SERVICE_NAME="bluetooth-suspend.sh"
SOURCE_FILE="./$SERVICE_NAME"
DESTINATION="/usr/lib/systemd/system-sleep/$SERVICE_NAME"

install_script() {
	echo "Installing $SERVICE_NAME..."

	if [ ! -f "$SOURCE_FILE" ]; then
		echo "Error: $SOURCE_FILE not found in the current directory."
		exit 1
	fi

	echo "Copying $SERVICE_NAME to $DESTINATION..."
	sudo cp "$SOURCE_FILE" "$DESTINATION"

	echo "Installation complete. The script is now active for system-sleep"
}

uninstall_service() {
	echo "Uninstalling $SERVICE_NAME..."

	if [ -f "$DESTINATION" ]; then
		echo "Removing $SERVICE_NAME from $DESTINATION..."
		sudo rm -f "$DESTINATION"
	else
		echo "Service file not found in $DESTINATION. Skipping removal."
	fi

	echo "Uninstallation complete. The script has been removed."
}


if [ "$1" == "install" ]; then
	install_script
elif [ "$1" == "uninstall" ]; then
	uninstall_script
else
	echo "Usage: $0 [install|uninstall]"
	exit 1
fi
