---
title: "May 6 – Creating a Shared Partition for Dual Boot: Kali & Arch Linux"
date: 2025-05-06 22:00:00 +0530
categories: [Linux Life, Cyber Journal, Sysadmin Hacks]
tags: [dual-boot, kali-linux, arch-linux, shared-partition, ext4, fstab, hacker-setup]
pin: true
---
Creating a Shared Partition for Dual Boot: Kali & Arch Linux
Mission: Establish a shared filesystem between Kali Linux (the aggressive pentester) and Arch Linux (the minimalist powerhouse). No more juggling files between distros—just seamless data exchange.

### **Step 1: Carving Out Space**

****First, I needed to free up some disk real estate. Booted into Kali Live ISO, armed with GParted—the Swiss Army knife of disk partitioning.

Shrank the main partition, leaving unallocated space (raw, unclaimed territory).

Forged a new partition (ext4), labeled "Shared"—because Linux-to-Linux communication thrives on ext4. (Windows would demand exfat, but we don’t cater to peasants here.)

### **Step 2: Mounting the Beast**

Booted into Kali’s main install, then:

Created a mount point:

```bash
sudo mkdir /mnt/shared
Manually mounted it (for testing):
```

```bash
sudo mount /dev/sdXn /mnt/shared
(Replace sdXn with your actual partition—lsblk is your friend.)
```

Made it permanent by editing /etc/fstab:

```bash
sudo nano /etc/fstab
Added:/dev/sdXn    /mnt/shared    ext4    defaults    0    2
```

### **Step 3: Arch Linux Joins the Party**

****Rebooted into Arch (because why not?) and repeated the process:

**Same mount point creation:**

```bash
sudo mkdir /mnt/shared
Edited /etc/fstab with identical settings.
```

Now, both distros recognize the Shared partition—a digital no-man’s-land where files move freely between OSes.

### **Why This Rocks**

****No more USB shuffling or cloud middlemen.

Perfect for:

Storing pentest reports (Kali)

Keeping custom scripts (Arch)

Sharing logs, tools, loot between systems

### **Final Thought**

****This is true sysadmin sorcery—two Linux distros, one shared playground. Efficiency. Elegance. Hackery.

Now, go forth and dual-boot like a pro.

// End of Transmission /
