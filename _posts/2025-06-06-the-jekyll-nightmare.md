---
title: "🧨 The jekyll Nightmare: How I Fought Sass Errors and Won (Kinda)"
date: 2025-06-06 16:00:00 +0530
categories: [debugging, DevLogs]
tags: [jekyll, sass, chirpy, terminal, blog, bugfix, developer-life, funny]
pin: false
toc: true
comments: true
permalink: /posts/the-jekyll-nightmare/
---

> "I just wanted a blog. Instead, I summoned the Sass Kraken." – Every Dev, Eventually
> 

---

## 💻 Prologue: The Command That Opened Hell

There I was. Dim-lit terminal. Cold coffee. Full linux power.

```bash
bundle exec jekyll serve
```

I hit Enter with the confidence of a hacker who’s installed Arch before.

**Big mistake.**

That innocent-looking line triggered a full-blown **Sasspocalypse**—undefined mixins, cryptic errors, and deprecation warnings that read like ancient curses.

Welcome to my chaotic chronicles. Buckle up.

---

## ⚔️ Chapter 1: First Blood — “Undefined Mixin”

**Terminal screams in red:**

```
Error: Undefined mixin.
119 │   @include prompt("tip", "\f0eb", 400);
```

Me: “Cool. Just a missing mixin. Should be a quick fix.”

LOL.

I dug through my SCSS like a digital archaeologist and finally found it—**_sass/addon/module.scss** had the `prompt()` mixin hiding like it owed me money.

### Fix Attempt #1:

```scss
@use "module";
@include module.prompt("tip", "\f0eb", 400);
```

**Result:**

```
There is no module with the namespace "module".
```

Me: “Oh, you gotta be kidding me.”

### 🧠 The Enlightenment:

Turns out, jekyll treats SCSS paths like riddles. I had to do this:

```scss
@use "addon/module" as module;
@include module.prompt("tip", "\f0eb", 400);
```

Sanity status: **Unstable.**

Progress: **Made.**

---

## 🧨 Chapter 2: The Sass Deprecation Warning That Wouldn’t Die

As if mixins weren’t enough, Sass dropped this passive-aggressive gem:

```
Deprecation Warning [mixed-decls]: declarations after nested rules will be changing...
```

Translation: “Fix your CSS, peasant.”

**Offending code:**

```scss
@media (prefers-color-scheme: light) {
  // nested styles
}
font-size: 16px; // NOPE ❌
```

### The Fix?

Either:

- Move `font-size` *above* the `@media`,
    
    or
    
- Wrap it like a Christmas gift from someone who hates you:

```scss
& {
  font-size: 16px;
}
```

I went with **Option 1** because my CSS shouldn’t need a gift wrapper.

---

## 🌀 Chapter 3: The Infinite Loop of Mixins

Just when I thought I was free:

```
Error: Undefined mixin.
268 │     @include label(inherit);
```

Again?! I JUST FIXED THIS!

So here's the thing. You have two choices with `@use`:

- `@use "module" as module;` → Use mixins like `module.label()`
- `@use "module" as *;` → Use mixins like `label()`

I was *mixing both styles* like a bad margarita.

### 🛠️ Final Fix:

```scss
@use "addon/module" as module;
@include module.label(inherit);
```

Pro tip: **Pick a style and commit like it's a relationship.** 💍

---

## ☠️ Chapter 4: The Final Boss – `$footer-height`

Ah, just one more build. Right? WRONG.

```
Error: Undefined variable.
157 │     height: $footer-height;
```

Me: “You have *got* to be kidding.”

Variable? It *existed.*

Location? `_sass/addon/variables.scss`

### Issue?

**jekyll wasn’t importing it.**

I was screaming at my terminal like it was a disobedient dog.

### 💡 Final Fix:

```scss
@use "addon/variables" as *;
```

The `*` means: "Just bring *everything*. I'm tired. You're tired. Let's go."

---

## 🎉 Epilogue: The Site Finally Built (But At What Cost?)

After:

- 37 Stack Overflow tabs
- 5 “quick fixes” that broke everything more
- 1 existential meltdown…

**It. Finally. Worked.**

My jekyll blog built without errors.

I stared at the terminal like Frodo after throwing the ring into Mount Doom.

---

## 💡 Lessons from the Fire

- **Sass @use is a control freak.** It *needs* structure, like a bossy project manager.
- **Deprecation warnings** are soft threats that age into hard errors.
- **grep -r** is your sword. Learn it. Master it.
- **Assume nothing.** Especially with mixins.

---

## 🤖 Advice for Fellow Cyberdevs

- `bundle exec jekyll serve --trace` → Trace like a pro.
- **RTFM** = *Read The Freaking Mixin.*
- When in doubt:

```bash
rm -rf .jekyll-cache && reboot life
```

---

## 🧬 Final Thought

If jekyll and Sass were a movie, it’d be a **horror-comedy**—you’re both the victim *and* the punchline. But hey, if my suffering makes your path easier, I’ve done my job.

### 🚀 Until the next `gem update` breaks everything...

Stay sane, hackers.

And may your mixins always be defined. 😈

```bash
echo "Blog’s up, baby." >> /dev/terminal
```

---

### 💬 P.S.

If this gave you a laugh (or trauma flashbacks), share it. Misery loves company.

Follow me for more chaotic debugging sagas, cyber tricks, and terminal therapy.

**arenredd.github.io**

Your favorite cybersecurity dev with *just enough patience* to survive jekyll.
