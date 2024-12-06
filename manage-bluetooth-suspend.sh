#!/bin/bash

SERVICE_NAME="bluetooth-suspend.service"
SOURCE_FILE="./$SERVICE_NAME"
DESTINATION="/etc/systemd/system/$SERVICE_NAME"

install_service() {
	echo "Installing $SERVICE_NAME..."

	if [ ! -f "$SOURCE_FILE" ]; then
		echo "Error: $SOURCE_FILE not found in the current directory."
		exit 1
	fi

	echo "Copying $SERVICE_NAME to $DESTINATION..."
	sudo cp "$SOURCE_FILE" "$DESTINATION"

	echo "Reloading systemd daemon..."
	sudo systemctl daemon-reload

	echo "Enabling $SERVICE_NAME..."
	sudo systemctl enable "$SERVICE_NAME"

	echo "Installation complete. The service is now active."
}

uninstall_service() {
	echo "Uninstalling $SERVICE_NAME..."

	echo "Disabling $SERVICE_NAME..."
	sudo systemctl disable "$SERVICE_NAME"

	if [ -f "$DESTINATION" ]; then
		echo "Removing $SERVICE_NAME from $DESTINATION..."
		sudo rm -f "$DESTINATION"
	else
		echo "Service file not found in $DESTINATION. Skipping removal."
	fi

	echo "Reloading systemd daemon..."
	sudo systemctl daemon-reload

	echo "Uninstallation complete. The service has been removed."
}


if [ "$1" == "install" ]; then
	install_service
elif [ "$1" == "uninstall" ]; then
	uninstall_service
else
	echo "Usage: $0 [install|uninstall]"
	exit 1
fi
