---
title: "Fixing CLI Tools & Custom grub – My Arch & Kali Dual Boot Ride"
date: 2025-05-28
tags: [arch-linux, kali-linux, grub, customization, "Termshark", "CLI Tools", troubleshooting, linux]
categories: [linux, "System customization", troubleshooting]
pin: false
toc: true
comments: true
permalink: /posts/arch-linux-cli-and-grub-fixes/
---

## 🧭 A Lazy Day Turned linux Journey

It started as just another lazy Sunday afternoon. You know those days when you tell yourself, "I'll just chill and maybe learn a thing or two." I was halfway through a cup of coffee and watching some random linux videos on YouTube when a few CLI tools caught my attention — ncdu, zoxide, exa, glances, and iotop.

These weren't just eye-candy tools. They looked useful. So I thought, “Why not spice up my Arch install with some of these?” I fired up my terminal on Arch and typed ncdu.

Boom.
`command not found`
And just like that, my chill Sunday turned into a deep dive into the minimalist world of arch-linux, AUR packages, and — later — a beautiful custom grub menu for my dual boot with Kali.

## 🚧 Part 1: Missing CLI Tools? Welcome to Arch.

If you’ve ever used Ubuntu or something more “beginner-friendly,” you might be used to a bunch of handy tools being pre-installed. Arch doesn’t believe in that. It’s all about giving you only what you ask for. Nothing more. Nothing less.

So when ncdu didn’t work, neither did zoxide or exa.

The Fix? Simple.

### Official repo tools

```bash
sudo pacman -S ncdu lshw fd zoxide glances iotop
```

### AUR tools

```bash
yay -S duf eza
```

💡 Note: exa is deprecated now. eza is its modern replacement — and it’s awesome.

## 🕵️ Part 2: termshark Error – Exit Status 13

Now here’s where things got spicy.

I was excited to try termshark, the cool TUI-based Wireshark alternative. But when I launched it:

```bash
Could not enumerate network interfaces: exit status 13
```

Cue the dramatic music 🎻.

I started Googling. Turns out, termshark uses tshark, which in turn needs permission to read from network interfaces. And on linux, raw socket access is sacred ground — not just any user gets in.

I had two options:

### Option 1: Just Use sudo

```bash
sudo termshark
```

It works. But who wants to run everything with sudo?

### Option 2: The Right Way (Safer)

```bash
sudo pacman -S wireshark-cli
sudo usermod -aG wireshark $USER
sudo chgrp wireshark /usr/bin/dumpcap
sudo chmod 750 /usr/bin/dumpcap
sudo setcap cap_net_raw,cap_net_admin=eip /usr/bin/dumpcap
```

```bash
reboot
```

After rebooting, termshark finally opened like a charm — no sudo needed. Clean and safe.

## ⚙️ Part 3: Dual Boot + Custom grub Theme = Chef's Kiss

So here’s the setup: I’m running a dual boot — arch-linux and kali-linux.

Now, when I installed Arch after Kali, Arch’s grub loader took control (as expected in an EFI setup). That’s fine — Arch’s grub is easier for me to tweak.

But the default grub menu? Meh.
It was plain, lifeless, and didn’t scream “You built this machine.”

So I decided to make it mine.

### 🎨 grub customization – Step by Step

Picked a Theme
Found a slick one online and modified it slightly to suit my setup.

Added Logos

✅ arch-linux logo

✅ kali-linux logo

Tuned Colors & Fonts
Gave it that dark, hacker feel — Tron vibes 🌌

Placed the Theme

```bash
/boot/grub/themes/ArenGrub
Edited the grub Config
```

```bash
sudo nano /etc/default/grub
Added:
```

```bash
GRUB_THEME="/boot/grub/themes/ArenGrub/theme.txt"
```

Updated grub

```bash
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

Rebooted…

And there it was.
My own custom grub menu, looking clean, colorful, and completely mine.

# 🧪 Commands Recap

## Essential CLI tools

```bash
sudo pacman -S ncdu lshw fd zoxide glances iotop
yay -S duf eza
```

# termshark + tshark permissions

```bash
sudo pacman -S wireshark-cli
sudo usermod -aG wireshark $USER
sudo chgrp wireshark /usr/bin/dumpcap
sudo chmod 750 /usr/bin/dumpcap
sudo setcap cap_net_raw,cap_net_admin=eip /usr/bin/dumpcap
```

## grub Theme

```bash
GRUB_THEME="/boot/grub/themes/ArenGrub/theme.txt"
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

## 🧠 Final Thoughts

What started as a simple curiosity turned into hours of learning, fixing, and customizing.

This is why I love linux.

It’s not just an operating system. It’s a playground for tinkerers, a battlefield for learners, and a canvas for creators. It breaks just enough to teach you. And when you fix it — it feels amazing.

If you’re dual booting like me or diving into the Arch world, don’t be afraid to get your hands dirty. Tweak, break, fix, repeat.

And remember…

You’re the architect of your system.
