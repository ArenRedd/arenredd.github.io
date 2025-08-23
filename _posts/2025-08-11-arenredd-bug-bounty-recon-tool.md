---
title: "ArenRedd: The Bug Bounty Recon Script That Makes Targets Beg for Mercy"
date: 2025-08-11 18:35:00 +0530
permalink: /posts/arenredd-bug-bounty-recon-tool-automation/
categories: [Cybersecurity, Bug Bounty, Tools]
tags: [bug bounty, recon, ethical hacking, nuclei, nmap, subfinder, httpx, OSINT, kali linux, vulnerability scanning]
image: /assets/img/arenredd-tool-banner.png
path: /assets/img/image2.png
alt: "ArenRedd Bug Bounty Recon Tool Screenshot"
width: 1200
height: 675
pin: false
comments: true
---

So… it all started with a blank terminal and too much caffeine.

I wasn’t looking to make some polished corporate scanner with a fancy GUI and pastel buttons. Nah… I wanted something raw. Something that when you run it, the terminal growls back at you and says: “I’m hungry… feed me targets.”

This is the birth story of ArenRedd – my personal Bug Bounty Recon Tool.
Step 1: The Idea

Like most hacker projects, it began with a problem:
I was tired of juggling subfinder, httpx, nmap, nuclei, and half a dozen other tools like some packet-sniffing circus act.

I wanted one script to rule them all — drop a domain, grab subdomains, check which ones are alive, probe their ports, and then smash them with vulnerability templates.
Step 2: The Birth of the Beast

I cracked open Kali Linux, fired up nano, and started throwing together commands like a hacker making ramen — a little of this, a dash of that.

    Subfinder to get those sweet subdomains.

    httpx to check which are alive.

    Nmap to see which ports are whispering secrets.

    Nuclei to go full vigilante and look for CVEs & known exploits.

I slapped an ASCII art banner on top because a hacker tool without a banner is just… boring.
Step 3: First Blood (Testing)

Ran it on a target…
💻 Output? Beautiful.
🎯 Everything in neat text files — subdomains.txt, alive.txt, open_ports.txt, and vuln_report.txt.

No more switching terminals like a caffeinated octopus.
Step 4: Making It Ours

I didn’t just make it for me. I made it for our college cybersecurity club.
Why? Because bug bounty hunting is way more fun when you’re racing your friends to find the first vuln.

When someone asks:

    “How do I use it?”

It’s just:

./recon.sh target.com

… and let ArenRedd do the rest.
Why This Tool Slaps

    Automated Recon – Less typing, more pwning.

    Beginner Friendly – Even if your hacking experience is mostly “I installed Kali once”, you’re good.

    Perfect for Club Battles – Run it during practice sessions & compare loot.

Future Plans

Oh, we’re not done. The next versions might get:

    Screenshot previews of alive targets

    Automatic report generation

    Integration with Shodan & Have I Been Pwned

    Maybe even a GUI (if I wake up feeling fancy)

Moral of the story:
If you’ve got a dozen tools lying around like unused gym equipment, glue them together, automate the boring stuff, and add your own hacker flair. That’s how legends are made.
