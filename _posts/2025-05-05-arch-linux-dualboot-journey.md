---
title: "My arch-linux Dual-Boot Journey: Raw & Unfiltered"
date: 2025-05-05 22:00:00 +0530
categories: [cyber-journal, linux Life, OS Tweaks]
tags: [arch-linux, dual-boot, kali-linux, hyprland, pacman, hacker-journal, raw-linux]
pin: true
comments: true
permalink: /posts/arch-linux-dualboot-journey/
---
My arch-linux Dual-Boot Journey – Raw & Unfiltered

Yesterday, I finally decided to dual-boot arch-linux alongside Kali. No hand-holding, no shortcuts—just pure manual setup. Grabbed my USB, flashed Arch, and carved out unallocated space for it. Time to get my hands dirty.

Booting Up & Network Struggle
First hurdle? Getting online. No fancy GUI here—just iwctl to force my way into a connection. Felt like bypassing a firewall just to get basic access. Classic.

Partitioning – No Room for Weakness
I kept it lean:

One partition for linux (root)

Swap (because even hackers need breathing room)

A single EFI partition (shared with Kali)

Why? Because some BIOS implementations freak out with multiple EFI partitions. Not taking chances.

Installation – Slow Downloads & Mirror Tricks
Pacman was crawling—blame my ISP or the default mirrors. Found a Reddit thread suggesting a mirror update. Swapped in regional mirrors, and suddenly, things moved faster. Lesson learned: always optimize your sources.

Installed the basics:

GUI (because even I need visuals sometimes)

Vim & Kwrite (editors are a hacker’s best friend)

Bluetooth & Network Manager (gotta stay connected)

Post-Install – Customizing for Power
Arch wasn’t enough. I wanted Hyprland—because tiling WMs scream efficiency. Installed yay (Pacman’s rebellious helper) for AUR access.

Kali uses apt? Cute. Arch runs on Pacman—raw, fast, no-nonsense.

Also set up Flatpak for Discover (Arch’s "app store" equivalent). Not my usual style, but even hackers need convenience sometimes.

Final Thoughts – Why Arch Owns
Arch isn’t just another distro. It’s speed, control, and zero bloat. Every linux user should try it—if they can handle the grind.

Now? Time to break things and rebuild. Because that’s how you learn.

Stay sharp. Stay rooted.
