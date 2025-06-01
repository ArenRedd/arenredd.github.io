---
title: "How I Installed Kali NetHunter on My Android Without Rooting (And Lived to Tell the Tale)"
date: 2025-05-23 22:10:00 +0530
categories: [Android Hacking, Tutorials, NetHunter]
tags: [kali-linux, nethunter, android, termux, rootless, hacking, linux-on-android]
pin: false
comments: true
---

# **How I Installed Kali NetHunter on My Android Without Rooting (And Lived to Tell the Tale)**

So, you want to turn your innocent Android phone into a pocket-sized hacking machine without voiding your warranty? Good news—Kali NetHunter can now run **rootless**! No kingly root permissions needed, just Termux, some patience, and a willingness to ignore a few ominous Android warnings.

Here’s how I did it (and how you can too, without summoning the wrath of Google’s security overlords).

---

## **Disclaimer: Don’t Be a Menace**

Before we begin—this is for **education and awareness only**. No illegal shenanigans. If you use this to hack your neighbor’s Wi-Fi to change their router name to "FBI Surveillance Van," that’s on you.

---

## **What You’ll Need**

- **An Android phone (Android 12+ works, but it’s feisty)**
    - Android 12+ has a habit of murdering background processes like a overzealous task manager. We’ll tame it later.
- **Termux (the magic portal to Linux on Android)**
    - Get it from [F-Droid](https://f-droid.org/packages/com.termux/) or [GitHub](https://github.com/termux/termux-app/releases). **Avoid the Play Store version—it’s ancient.**

---

## **Step 1: Summon Termux from the Digital Abyss**

1. **Install Termux** (the APK you just downloaded).
2. **Open it** and type:CopyDownload
    
    ```bash
    pkg update -y
    ```
    
    (This is like giving Termux its morning coffee.)
    
3. **Grant storage access** (so it doesn’t live in digital solitary confinement):CopyDownload
    
    ```bash
    termux-setup-storage
    ```
    

---

## **Step 2: Download the NetHunter Install Script**

Time to fetch the goods:

```bash
pkg install wget -y
wget -O install-nethunter-termux https://offs.ec/2MceZWr
chmod +x install-nethunter-termux
```

*(Translation: "Hey Termux, download this suspicious-looking script and make it executable. Trust me.")*

---

## **Step 3: Run the Script (And Pray)**

Execute the installer:

```bash
./install-nethunter-termux
```

- **Choose your NetHunter flavor** (I went with the full version because why not?).
- **Wait.** This takes a while. Go make tea. Or coffee. Or contemplate life.

When asked:

- **"Delete downloaded rootfs?"** → **N** (Unless you enjoy re-downloading 2GB for fun.)

---

## **Step 4: Stop Android from Killing Your Fun**

Android 12+ has a nasty habit of terminating background processes (like NetHunter). Here’s how to disable its murderous tendencies:

1. **Enable Developer Options** (tap "Build Number" in Settings 7 times like a secret code).
2. **Find "Disable child process restrictions"** and toggle it **ON**.
    
    *(Now Android won’t assassinate NetHunter mid-session.)*
    

---

## **Step 5: Launch NetHunter Like a Hacker**

- **CLI Mode:**CopyDownload
    
    ```bash
    nh
    ```
    
    *(Boom. You’re in Kali Linux.)*
    
- **GUI Mode (KeX VNC):**CopyDownload
    
    ```bash
    nh kex passwd  # Set a password
    nh kex &       # Start the GUI
    ```
    
    *(Now you have a full Kali desktop on your phone. Wild.)*
    

---

## **Step 6: Install the NetHunter Store (For Extra Tools)**

1. **Download the NetHunter Store APK** from [their site](https://store.nethunter.com/).
2. **Ignore Android’s frantic warnings** ("This app is old! It might summon demons!").
3. **Install KeX Client** from the store to connect to your VNC session.

---

## **Final Boss: Connect to KeX**

- Open the KeX app.
- Create a new connection:
    - **Port:** **`5901`**
    - **Password:** (The one you set earlier)
- **Connect.**

**Congratulations!** You now have Kali NetHunter running **without root**, looking slick on your Android.

---

## **What Now?**

- Explore Kali tools (**`metasploit`**, **`aircrack-ng`**, etc.).
- **Don’t do anything dumb.**

---

### **Final Warning**

Android may occasionally side-eye you for running a full Linux distro in the background. If NetHunter gets killed, just restart it and shake your fist at the sky.

Happy (ethical) hacking! 🚀🔒
