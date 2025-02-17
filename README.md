# quadlets

codeuh's quadlets.

## RHEL-9 codeuh user quadlets

````bash
rsync -av --delete ./RHEL-9/codeuh/quadlets/ ~/.config/containers/systemd/
rsync -av --delete ./RHEL-9/codeuh/units/ ~/.config/systemd/user/
systemctl --user daemon-reload
````

## Fedora codeuh user quadlets

````bash
rsync -av --delete ./Fedora/codeuh/quadlets/ ~/.config/containers/systemd/
rsync -av --delete ./Fedora/codeuh/units/ ~/.config/systemd/user/
systemctl --user daemon-reload
````

## refs

[quadlet-podman](https://www.redhat.com/en/blog/quadlet-podman)

[podman-systemd-unit](https://docs.podman.io/en/latest/markdown/podman-systemd.unit.5.html)
