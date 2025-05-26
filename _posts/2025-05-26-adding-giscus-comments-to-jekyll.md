---
title: "How I Added Giscus Comments to My Jekyll Blog (And Fixed Every Damn Error on the Way)"
date: 2025-05-26
categories: [Blog Dev, Jekyll, GitHub]
tags: [chirpy, giscus, jekyll, comments, github-pages]
pin: false
toc: true
comments: true
---

Adding a comment system to a Jekyll blog sounds easy — until it isn’t.

I wanted something **minimal**, **privacy-respecting**, and built right into GitHub. Disqus was bloat. Utterances was limited. **Giscus**? Perfect.

But the road to setting it up was *chaos*. Here’s what I hit, how I fixed it, and a clean tutorial to help you avoid the same mess.

---

## ❌ Real Errors I Hit (And How I Fixed Each One)

### 1. **Wrong Repo Format**

At first, I tried setting up Giscus with this:

```
arenredd/arenredd/comment-engine
```

🧱 **Wrong.** That’s not how GitHub repo paths work.

✅ **Fix:** Changed it to the correct format:

```
arenredd/comment-engine
```

---

### 2. **Giscus Not Installed on Repo**

Giscus gave me this lovely error:

> "Cannot use giscus on this repository."
> 

✅ **Fix:** Went to https://github.com/apps/giscus, clicked **Configure**, and installed it **on the `comment-engine` repo only**.

---

### 3. **No Discussion Category**

Even after installation, Giscus didn’t detect any category.

✅ **Fix:** Opened the repo → **Discussions** → Created a new category called:

```
Blog Comments
```

Set it to **Announcements** type (so only maintainers can start threads).

---

### 4. **Couldn’t Find the `category_id`**

GitHub hides this deep. Inspecting HTML didn’t help.

✅ **Fix:** Used GitHub’s [GraphQL Explorer](https://docs.github.com/en/graphql/overview/explorer) and ran this:

```graphql
{
  repository(owner: "ArenRedd", name: "comment-engine") {
    discussionCategories(first: 10) {
      nodes {
        id
        name
      }
    }
  }
}

```

Grabbed the `id` for "Blog Comments" → pasted into `_config.yml`.

---

### 5. **Didn’t Know the `repo_id`**

✅ **Fix:** Ran this in the browser console:

```jsx
fetch("https://api.github.com/repos/ArenRedd/comment-engine")
  .then(res => res.json())
  .then(data => console.log("repo_id:", data.node_id));
```

Copied the `repo_id` result and dropped it in.

---

## 🛠️ The Final Working `_config.yml` Giscus Block

```yaml
comments:
  active: giscus
  giscus:
    repo: ArenRedd/comment-engine
    repo_id: R_kgDOOwlWwQ
    category: Blog Comments
    category_id: DIC_kwDOOwlWwc4Cql_Y
    mapping: pathname
    input_position: bottom
    lang: en
```

No more errors. No more guessing.

---

## 🚀 Clean Giscus Setup Tutorial (If You're Starting Fresh)

Here’s the process boiled down to a checklist:

### ✅ Step-by-Step:

1. **Create a new public repo** just for comments:
    
    ```bash
    arenredd/comment-engine
    ```
    
2. **Enable Discussions** in repo settings.
3. **Create a Discussion Category** called `Blog Comments` (type: Announcements).
4. **Install Giscus GitHub App**
    
    → https://github.com/apps/giscus
    
5. **Get your repo ID**
    
    Open console and run:
    
    ```jsx
    fetch("https://api.github.com/repos/YOUR_USERNAME/comment-engine")
      .then(res => res.json())
      .then(data => console.log(data.node_id));
    ```
    
6. **Get your category ID**
    
    Use GitHub's GraphQL Explorer:
    
    ```graphql
    {
      repository(owner: "YOUR_USERNAME", name: "comment-engine") {
        discussionCategories(first: 10) {
          nodes {
            id
            name
          }
        }
      }
    }
    ```
    
7. **Update your `_config.yml`**
    
    Add the full Giscus block like above under `comments:`.
    
8. **Commit and push your changes**
    
    ```bash
    git add .
    git commit -m "Enable Giscus comments"
    git push
    ```
    

---

## 🧠 Final Thoughts

Now my Jekyll blog has GitHub-native comments with zero bloat. No cookies. No trackers. Just clean Markdown and community interaction.

And yeah — I broke everything along the way, but I built it back up better.

If you're setting up Giscus and hit roadblocks, just come back to this post. I've walked the fire path for you 🔥

## 🗨️ Got Questions?
Scroll down to the bottom of this post — the Giscus comment box is waiting.

(Yes, it's meta. You're commenting on the post about comments. Welcome to the loop.)
