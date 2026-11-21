# quadlets

codeuh's quadlets.

## Which host gets what

The two hosts deploy **different** directories. The directory names are historical
(`RHEL-9` is theripper, `Fedora` is rampage; both machines run Fedora).

| Host | Root quadlets come from | Notes |
|---|---|---|
| **rampage** | `Fedora/root/` (everything) | nginx, cloudflared, grafana, prometheus, loki, tempo, ... |
| **theripper** | `RHEL-9/root/` **plus 3 files from `Fedora/root/`** | jellyfin, ollama, podman-streamlit, prometheus-podman-exporter, plus `nvidia-gpu-exporter.{container,image}` and `prometheus-podman-exporter-root.container` |

Never deploy `Fedora/root/` to theripper: it would start cloudflared, nginx, etc. there
at the next boot (a second cloudflared on the same tunnel token would send half the
traffic to a host with none of the backends). Always dry-run first (`rsync -avn ...`)
and check `hostname` before running anything with `--delete`.

User-level quadlet directories (`RHEL-9/codeuh`, `Fedora/codeuh`) are not in use; the
user quadlets on theripper (`~/.config/containers/systemd`) are not tracked here.

## RHEL-9 codeuh user quadlets

````bash
rsync -av --delete ./RHEL-9/codeuh/quadlets/ ~/.config/containers/systemd/
rsync -av --inplace --no-t --omit-dir-times ./RHEL-9/codeuh/units/ ~/.config/systemd/user/
systemctl --user daemon-reload
````

## RHEL-9 root user quadlets (theripper)

Theripper also runs three quadlets that live in `Fedora/root/`, so deploy without
`--delete` (it would remove them) and copy those three explicitly:

````bash
sudo rsync -av ./RHEL-9/root/quadlets/ /etc/containers/systemd/
sudo rsync -av ./Fedora/root/quadlets/nvidia-gpu-exporter.container \
  ./Fedora/root/quadlets/nvidia-gpu-exporter.image \
  ./Fedora/root/quadlets/prometheus-podman-exporter-root.container \
  /etc/containers/systemd/
sudo rsync -av --inplace --no-t --omit-dir-times ./RHEL-9/root/units/ /etc/systemd/system/
sudo rsync -av --inplace --no-t --omit-dir-times ./Fedora/root/units/nvidia-gpu-exporter-image.timer /etc/systemd/system/
sudo systemctl daemon-reload
````

## Fedora codeuh user quadlets

````bash
rsync -av --delete ./Fedora/codeuh/quadlets/ ~/.config/containers/systemd/
rsync -av --inplace --no-t --omit-dir-times ./Fedora/codeuh/units/ ~/.config/systemd/user/
systemctl --user daemon-reload
````

## Fedora root user quadlets (rampage only)

````bash
sudo rsync -av --delete ./Fedora/root/quadlets/ /etc/containers/systemd/
sudo rsync -av --inplace --no-t --omit-dir-times ./Fedora/root/units/ /etc/systemd/system/
sudo systemctl daemon-reload
````

## refs

[quadlet-podman](https://www.redhat.com/en/blog/quadlet-podman)

[podman-systemd-unit](https://docs.podman.io/en/latest/markdown/podman-systemd.unit.5.html)
