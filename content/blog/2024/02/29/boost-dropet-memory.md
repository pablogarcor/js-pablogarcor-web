---
title: "Boosting Your DigitalOcean Droplet's Memory: No Upgrade Needed When You're Short on RAM"
date: 2024-02-29
slug: "boost-digitalocean-droplet-memory-without-upgrading"
author: "Pablo García Ortega"
tags: ["DigitalOcean", "Server Optimization", "Web Development", "Memory Management", "SWAP Memory", "Linux Server", "Tech Solutions"]
description: "Learn how to enhance your DigitalOcean Droplet's memory without opting for a costly upgrade. This guide by Pablo García Ortega walks you through the steps to leverage SWAP memory, ensuring your projects run smoothly on limited RAM. Ideal for developers and tech enthusiasts looking for efficient server management techniques."
---


The entry-level DigitalOcean Droplet is useful for small projects, but sometimes **512MB of RAM** can feel quite limiting. I found myself in a situation where I was using an oversized droplet for just a static webpage and a mail server. My goal was to downsize to the **smallest possible droplet**. Upon monitoring, I discovered the RAM usage hovered around 500MB—dangerously close to the 512MB limit of the lowest-tier droplet. That's when the idea of leveraging **SWAP memory** to augment the RAM came to mind.

## Adding a Swap File to Your Droplet
If your applications occasionally run out of RAM, incorporating a swap file can prevent memory exhaustion. It's important to remember, though, that relying too much on swapping can decelerate your application because swap file operations (read/write to the HDD) are slower than those performed in RAM.

1. **Log into Your Droplet**. Securely access your server.
2. **Check for an Active Swap File**. Use the command: 
```bash
sudo swapon --show
```
If there's no active swap, you're good to proceed.
3. **Create a Swap File for the droplet**. I opted for a 2GB swap file with 
```bash
sudo fallocate -l 2G /swapfile
```
5. **Set the Right Permissions**.
```bash
sudo chmod 600 /swapfile
```
7. **Designate the File as Swap Space**. Use the next command to mark it: 
```bash
sudo mkswap /swapfile
```
9. **Activate the Swap File**. Enable it with:
```bash
sudo swapon /swapfile
```
10. **Ensure Permanency**. To have the swap file enabled at boot, append it to your fstab file with: 
```bash
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
```

## Conclusion
Low RAM droplets offer great value, and with this straightforward adjustment, you can enhance their utility even further. This enables running more RAM-intensive applications without the need for a more expensive upgrade.