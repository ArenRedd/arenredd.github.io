---
title: "26th Apr Log – Solana Spawned, grub Resurrected"
date: 2025-04-26 21:00:00 +0530
categories: [cyber-journal, Privacy, OS Tweaks]
tags: [solana, cryptocurrency, kali-linux, dual-boot, grub, windows, linux, partitioning, live-usb, quantum-computing]
pin: false
comments: true
permalink: /posts/solana-spawned-grub-resurrected/
---
**Journal Entry**

Today, I am attempting to create my own cryptocurrency using kali-linux. It has been quite challenging, but I successfully created a cryptocurrency with the Solana wallet. However, I am having trouble customizing it.

I also came across a YouTube video about running Windows on linux and vice versa using wsl, which seemed interesting. I've started the process of setting up a dual boot. My first step was to split my disk partition, but I encountered a problem: since kali-linux is installed on the main partition, I can’t split it directly from my installed Kali system.

To work around this, I installed kali-linux for live boot on a USB drive. After splitting my partition, I flashed the USB drive with the Windows 11 ISO. However, when I installed Windows, it did not recognize my UN-allocated partition. To resolve this, I found a compatible storage driver for my laptop and saved it on the same USB drive with the Windows ISO.

After finishing the Windows installation, which took about half a day, I restarted my laptop only to boot directly into Windows without any menu options to select kali-linux. Later in the evening, I repaired the grub boot-loader for both kali-linux and Windows using the Kali live boot. I discovered that I couldn't resize, move, or safely reinstall grub directly from my installed system, which is why the live boot was necessary.

After repairing the grub menu, I watched more YouTube videos about quantum computers. That’s how my day ended. I realized I actually enjoy fixing OS-level problems.
