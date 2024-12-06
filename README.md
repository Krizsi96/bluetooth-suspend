# bluetooth-suspend
Script for `systemd` to toggle Bluetooth when PC goes to suspend.

## Installation

You can install the service via running the `manage-bluetooth-suspend.sh` script with the following command.

```shell
./manage-bluetooth-suspend.sh install
```

This will copy the script to the `systemd/system-sleep` folder so that `systemd` can call it on sleep events.

## Uninstallation

To uninstall the service, run the following command.

```shell
./manage-bluetooth-suspend.sh uninstall
```

This will remove the script from the `systemd/system-sleep` folder.
