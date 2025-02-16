# Windows Scripts

I'm running the script setup-port-forwards.ps1 on my Windows host to forward ports my Quadlets expose. I'm running it as a scheduled task on startup. I want to be able to access these services from other VMs i'm running on my host.

# Helpful commands

List all current forwards

````PowerShell
netsh interface portproxy show all
````

Remove specific forwards

````PowerShell
netsh interface portproxy delete v4tov4 listenport=3000 listenaddress=0.0.0.0
````

Remove all forwards

````PowerShell
netsh interface portproxy reset
````