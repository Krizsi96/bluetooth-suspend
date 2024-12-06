# bluetooth-suspend
`systemd` service to toggle Bluetooth when PC goes to suspend.

## Installation

You can install the service via running the `manage-bluetooth-suspend.sh` script with the following command.

```shell
./manage-bluetooth-suspend.sh install
```

This will copy the service file to the `systemd` folder, reload the services and enable the service.

## Check status

You can check the status of the service and its logs with the following command.

```shell
systemctl status bluetooth-suspend.service
```

## Uninstallation

To uninstall the service, run the following command.

```shell
./manage-bluetooth-suspend.sh uninstall
```

This will disable the service, reload `systemd` and remove the service file from the `systemd` folder.
