---
title: "1st May Log – docker Ubuntu Container on Kali with Shared Mounts"
date: 2025-05-01 21:30:00 +0530
categories: [cyber-journal, docker Lab, linux Tweaks]
tags: [docker, kali-linux, ubuntu, containers, bind-mount, linux-hacks, hacker-journal, wsl]
pin: false
comments: true
permalink: /posts/docker-ubuntu-container-on-kali/
---
Today, I Just Ran the update command in kali-linux, but hit a wall with docker's repository. Turns out, docker doesn't provide a repo for kali-rolling, so I was greeted with a 404 error. Quick fix: swapped it out with the Debian bookworm repo — works like a charm with Kali. After that, I ran `sudo docker run hello-world` and got the classic docker greeting: "Hello from docker!"

Decided to try the Ubuntu container next, so I ran `sudo docker run -it ubuntu bash` and boom, I'm inside the container, root@<container-id>:/# — fresh Ubuntu setup. Not a full VM like virtualbox or VMware, but a lightweight, isolated environment acting like an Ubuntu system.

The next step: I wanted to access files between my Kali host and the Ubuntu container. The magic? Using bind mounts or volumes to share files. I mounted the folder `/home/arenmohanix/shared-folder` from Kali into the container with this command:

`sudo docker run -it -v /home/arenmohanix/shared-folder:/mnt/shared ubuntu bash`

After some tweaking and troubleshooting, I got it running. I now have a custom Ubuntu container up and running in docker, with seamless file sharing between Kali and the container. The build process is solid, and I’m looking forward to diving deeper into docker and customizing my containers even more.
