# quadlets

codeuh's quadlets.

## RHEL-9 codeuh user quadlets

````bash
rsync -av --delete ./RHEL-9/codeuh/quadlets/ ~/.config/containers/systemd/
rsync -av --inplace --no-t --omit-dir-times ./RHEL-9/codeuh/units/ ~/.config/systemd/user/
systemctl --user daemon-reload
````

## RHEL-9 root user quadlets

````bash
sudo rsync -av --delete ./RHEL-9/root/quadlets/ /etc/containers/systemd/
sudo rsync -av --inplace --no-t --omit-dir-times ./RHEL-9/root/units/ /etc/systemd/system/
sudo systemctl daemon-reload
````

## Fedora codeuh user quadlets

````bash
rsync -av --delete ./Fedora/codeuh/quadlets/ ~/.config/containers/systemd/
rsync -av --inplace --no-t --omit-dir-times ./Fedora/codeuh/units/ ~/.config/systemd/user/
systemctl --user daemon-reload
````

## Fedora root user quadlets

````bash
sudo rsync -av --delete ./Fedora/root/quadlets/ /etc/containers/systemd/
sudo rsync -av --inplace --no-t --omit-dir-times ./Fedora/root/units/ /etc/systemd/system/
sudo systemctl daemon-reload
````

## refs

[quadlet-podman](https://www.redhat.com/en/blog/quadlet-podman)

[podman-systemd-unit](https://docs.podman.io/en/latest/markdown/podman-systemd.unit.5.html)
