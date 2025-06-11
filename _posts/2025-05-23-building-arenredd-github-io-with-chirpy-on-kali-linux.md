---
title: "How I Built arenredd.github.io: A Developer Blog with Chirpy on Kali Linux"
date: 2025-05-23 23:50:00 +0530
categories: [Dev Journal, Web Projects, Blog Setup]
tags: [chirpy, jekyll, github-pages, kali-linux, gulp, ruby, web-dev, troubleshooting]
pin: true
comments: true
permalink: /posts/building-github-blog-on-kali/
---
# **Building My GitHub Blog with Chirpy: A Rollercoaster of Errors & Fixes**

When I decided to set up my personal blog using the **Chirpy Jekyll theme**, I expected a smooth, well-documented process. Instead, I found myself wrestling with dependency conflicts, cryptic errors, and deployment quirks—especially since I was working on **Kali Linux**, which isn’t the most common choice for Jekyll development.

This post isn’t just another "how to set up a blog in 5 minutes" tutorial. Instead, it’s a **real-world troubleshooting log**—documenting the issues I faced and how I fixed them. If you're running into similar problems, hopefully, this saves you some headaches.

---

## **🛠 My Setup & Initial Checks**

Before diving into the errors, here’s the environment I was working with:

- **OS:** Kali Linux
- **Ruby:** **`3.3.8`**
- **Bundler:** **`2.6.9`**
- **Jekyll:** **`4.4.1`**
- **Node.js:** **`20.19.0`**
- **npm:** **`9.2.0`**
- **Gulp CLI:** **`3.0.0`**
- **Package Managers:** APT, Bundler, nvm

Everything looked good at first glance—until I started running commands.

---

## **🔥 Problem #1: Ruby Gem Conflicts (ffi & sassc Errors)**

### **The Error:**

Running **`jekyll -v`** spat out a wall of warnings:

```bash
Ignoring ffi-1.15.5 because its extensions are not built. Try: gem pristine ffi --version 1.15.5
Ignoring sassc-2.4.0 because its extensions are not built. Try: gem pristine sassc --version 2.4.0
```

*(Repeated multiple times—annoying, right?)*

### **The Cause:**

These gems (**ffi** and **sassc**) require native extensions that weren’t compiled properly. Kali Linux, being a security-focused distro, doesn’t always come with all the development tools needed for Ruby gem compilation.

### **The Fix:**

1. **Install missing build tools:**
    
    ```bash
    sudo apt install build-essential libffi-dev ruby-dev
    ```
    
2. **Reinstall the problematic gems with system libraries:**
    
    ```bash
    gem install ffi -v 1.15.5 -- --use-system-libraries
    gem pristine ffi --version 1.15.5
    
    gem install sassc -v 2.4.0 -- --use-system-libraries
    gem pristine sassc --version 2.4.0
    ```
    

After this, **`jekyll -v`** should run without those pesky warnings.

---

## **⚙️ Problem #2: Gulp Issues (Local Version Unknown)**

### **The Error:**

Running **`gulp -v`** gave:

```bash
CLI version: 3.0.0
Local version: Unknown
```

### **The Cause:**

The **Chirpy theme** relies on **Gulp 4** for asset processing (CSS, JS optimization). The error means Gulp is installed globally, but the project doesn’t recognize a local version.

### **The Fix:**

1. **Install Gulp locally:**
    
    ```bash
    npm install --save-dev gulp@4
    ```
    
2. **Verify installation:**
    
    ```bash
    npx gulp -v
    ```
    
    *(Should now show both CLI and local versions.)*
    
3. **Run Gulp tasks:**
    
    ```bash
    npx gulp
    ```
    
    *(This builds assets before Jekyll processes the site.)*
    

---

## **🕸 Problem #3: GitHub Pages Deployment Failures (Silent Build Issues)**

### **The Problem:**

I pushed my repo to GitHub, but my site **wouldn’t update**—no obvious errors, just a broken or outdated build.

### **The Cause:**

GitHub Pages **doesn’t support all Jekyll plugins** or custom build steps (like Gulp tasks). Since Chirpy relies on preprocessing, you **must build locally first** before deploying.

### **The Fix:**

1. **Build the site in production mode:**
    
    ```bash
    JEKYLL_ENV=production bundle exec jekyll build
    ```
    
2. **Deploy only the `_site` folder to `gh-pages`:**
    
    ```bash
    cd _site
    git init
    git remote add origin https://github.com/yourusername/yourrepo.git
    git checkout -b gh-pages
    git add .
    git commit -m "Deploy site"
    git push -f origin gh-pages
    ```
    
3. **In GitHub repo settings:**
    - Go to **Settings > Pages**
    - Set **Source** to **Deploy from `gh-pages` branch**

Now, GitHub serves the pre-built site instead of trying (and failing) to build it itself.

---

## **🧪 Problem #4: html-proofer Complaints (Invalid Anchor Links)**

### **The Error:**

Running **`bundle exec jekyll build`** sometimes failed with:

```bash
linking to internal hash # that does not exist
```

### **The Cause:**

Some links (like **`href="#"`**) are flagged by **html-proofer** (a built-in Chirpy tool) because they don’t point to a real anchor.

### **The Fix:**

1. **Replace `#` with a valid anchor:**
    
    ```html
    <a href="#top">Back to Top</a>
    ```
    
2. **Add an anchor target somewhere on the page:**
    
    ```html
    <a id="top"></a>
    ```
    

This keeps the same functionality while making **html-proofer** happy.

---

## **💡 Final Thoughts & Lessons Learned**

Setting up **Chirpy on Kali Linux** was **way harder** than I expected. The main issues stemmed from:

- **Ruby gem compilation problems** (fixed with **`-use-system-libraries`**)
- **Gulp version mismatches** (solved by local install)
- **GitHub Pages’ limitations** (workaround: pre-build & push **`_site`**)
- **Strict HTML validation** (fixed with proper anchor tags)

### **TL;DR – Key Takeaways**

✔ **Always check for native extension errors** in Ruby gems.

✔ **Install Gulp both globally and locally** (v4 for Chirpy).

✔ **Don’t rely on GitHub Pages to build**—do it yourself.

✔ **Validate HTML early** to catch broken links.

✔ **Avoid `href="#"`**—use real anchors instead.

If you’re on **Kali Linux** (or any non-standard dev environment) and trying to use **Jekyll + Chirpy**, be prepared for some troubleshooting. But once it’s working, Chirpy is **one of the cleanest, most customizable static site themes** out there.
