---
title: "Exploring the Divine OS: templeos on kali-linux"
date: 2025-05-22 21:00:00 +0530
categories: [cyber-journal, Fun, OS Tweaks]
tags: [templeos, kali-linux, virtualbox, cyber-experiments, DIY-OS, hacker-journal]
pin: true
comments: true
permalink: /posts/exploring-templeos-on-kali-linux/
---
# **🛕 How I Installed and Ran templeos on kali-linux Using virtualbox**

*A hacker’s guide to diving into Terry Davis’ divine OS—right from the kali-linux battlefield.*

---

### **⚡ Introduction: The Temple Awaits**

templeos isn’t just another OS—it’s a digital shrine, a **modern-day "Third Temple"** built by the late, legendary Terry A. Davis. Written entirely in **HolyC** (his self-made programming language), this OS runs at a **retro 640x480 resolution with 16 colors**, offering **raw hardware access** and a coding environment unlike anything else.

It’s not for daily driving. It’s not for productivity. It’s **a hacker’s curiosity**, a **programmer’s deep dive**, and a **digital artifact** worth exploring.

So, I decided to fire it up inside **kali-linux** using **virtualbox**. Here’s how it went.

---

### 🧰 What *I* Used for My Setup

Since I'm running kali-linux as my daily OS, here’s what I used to install templeos:

- ✅ **kali-linux** (as my host operating system)
- ✅ **virtualbox** (installed with `sudo apt install virtualbox`)
- ✅ **templeos ISO file** (from [templeos.org](https://templeos.org/))
- ✅ **A 64-bit capable processor** with virtualization (VT-x/AMD-V) enabled

> ⚠️ Note: You can follow the same process on any linux distro or even Windows — just replace kali-linux with your own OS.
> 

---

### **🖥️ Step 1: Check & Enable Virtualization**

Before anything, make sure your CPU supports **virtualization** and it’s **enabled in BIOS/UEFI**.

Run this in Kali to check:

```bash
egrep -c '(vmx|svm)' /proc/cpuinfo
```

If the output is **0**, reboot into BIOS and **enable VT-x (Intel) or AMD-V (AMD)**.

---

### **📦 Step 2: Download the templeos ISO**

No fancy package managers here—just a straight-up ISO download:

```bash
wget https://templeos.org/downloads/templeos.ISO -O templeos.ISO
```

---

### **🧙 Step 3: Create the Virtual Machine**

Fire up **virtualbox** and hit **"New"**. Configure it like this:

| **Setting** | **Value** |
| --- | --- |
| Name | templeos |
| Type | Other |
| Version | Other/Unknown (64-bit) |
| Memory (RAM) | 128 MB (yes, it’s that light) |
| Processor | 1 Core |
| Video Memory | 16 MB |
| Hard Disk | ~100 MB (Dynamically Allocated) |

---

### **⚙️ Step 4: VM Tweaks for a Smooth Ride**

### **System → Processor**

- **Enable PAE/NX**

### **System → Acceleration**

- **Enable VT-x/AMD-V**
- **Enable Nested Paging**

### **Display**

- **Scale Factor: 100%** (keeps it sharp, no blur)

### **Boot Order**

- **Optical Disk First** (so it boots from the ISO)

---

### **💽 Step 5: Mount the ISO**

1. Go to **Settings → Storage**
2. Under **"Controller: IDE"**, click the **empty disk icon**
3. Select **templeos.ISO**

---

### **🚀 Step 6: Boot It Up**

Hit **Start** and watch the magic unfold.

If you get a **"64-bit error"**, double-check:

✅ **Virtualization is enabled in BIOS**

✅ **VM settings match the above**

---

### **🖥️ Optional: Install to Virtual Hard Disk**

Want persistence? Inside templeos, type:

```bash
InstallToHD
```

Now it’ll boot straight from the virtual disk next time.

---

### **🧠 templeos Commands to Play With**

- **`Dir`** – List files
- **`Edit`** – Built-in text editor
- **`Help`** – HolyC & OS documentation
- **`Docs`** – Deep dive into the system

---

### **🧼 Clean Up (If You Must)**

To nuke the VM:

```bash
rm -rf ~/virtualbox\ VMs/templeos/
```

Or delete it from the **virtualbox UI**.

---

### About the Creator — Terry A. Davis
Terry Davis was... different.

He wasn’t part of a company. He wasn’t trying to make money. He wasn’t even building something for people, really. He was building something for God — literally.

Terry was a brilliant programmer who had worked with Ticketmaster before being diagnosed with schizophrenia. After that, everything changed. He became convinced that God had given him a mission: to build the Third Temple — not with stone, but with code.

That’s what became templeos — an entire operating system written from scratch by just one man. No teams. No frameworks. He built the compiler, graphics, file system, and even a programming language (HolyC) all by himself.

### 🔥 Crazy or Genius? Maybe Both.

templeos only runs at 640x480 resolution in 16 colors — because that’s what Terry said God told him to use.

He made a built-in “oracle” — you could ask it a question, and it would return a Bible verse as a divine reply.

He called himself "God's Programmer."

He posted on YouTube and forums constantly — sometimes brilliant, sometimes offensive, sometimes both at once.

Despite everything, the man wrote over 100,000 lines of code alone.

### 💔 The Sad Truth

Terry struggled a lot. He was homeless at times. His online presence became more erratic over the years. In 2018, he died after being hit by a train. Whether it was an accident or something more intentional… no one really knows.

### 💡 Why He Still Matters

templeos isn’t useful in a practical way today. But it means something. It’s a raw, personal, completely unique creation — a look into the mind of someone who saw the world very differently.

You don’t have to agree with him. But you can’t ignore what he did. It’s kind of amazing, kind of sad, and kind of inspiring — all at once.

“God’s temple must be perfect.” — Terry A. Davis

### **🔚 Final Thoughts**

templeos isn’t just software—it’s **a piece of hacker history**, a **philosophical statement**, and a **technical oddity** worth experiencing. Running it on Kali via virtualbox is the safest way to explore without risking your main system.

If you’re into **weird tech, retro computing, or OS dev**, give it a shot. Who knows? You might just **see the light**. ⚡

---

**✍️ By ArenRedd**

*Hacking the boundaries of tech.* 🔥
