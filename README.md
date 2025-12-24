# ArenRedd.github.io

A personal cybersecurity and technology blog built using **Hexo** and the **Reimu** theme, deployed via **GitHub Pages**.

This site documents real-world experiences in cybersecurity, hacking experiments, development failures, tooling deep dives, and infrastructure lessons — written from a practitioner’s perspective rather than a polished marketing lens.

---

## 🌐 Live Site

🔗 https://arenredd.github.io

---

## 🧠 About This Blog

This blog focuses on:

- Cybersecurity research & experiments
- Ethical hacking & red teaming concepts
- Linux, terminals, and low-level tooling
- Real deployment failures and debugging stories
- Developer workflows (Hexo, GitHub Pages, SSH, CI/CD)
- Honest technical writing without hype or fluff

The goal is to **document the process**, not just the success.

---

## 🛠️ Tech Stack

- **Static Site Generator:** Hexo
- **Theme:** Reimu
- **Hosting:** GitHub Pages
- **Deployment:** Hexo Git deployer
- **Content Format:** Markdown
- **Version Control:** Git
- **Auth:** SSH (no passwords)

---

## 📁 Repository Structure

```text
.
├── source/           # Blog posts and pages (Markdown)
│   ├── _posts/       # Blog articles
│   ├── about/        # About page
│   └── assets/       # Images and static assets
│
├── themes/reimu/     # Reimu theme (customized)
├── public/           # Generated static site (deploy target)
├── _config.yml       # Hexo configuration
└── package.json      # Node dependencies
````

---

## 🚀 Local Development

### 1. Clone the repository

```bash
git clone git@github.com:ArenRedd/arenredd.github.io.git
cd arenredd.github.io
```

### 2. Install dependencies

```bash
npm install
```

### 3. Run locally

```bash
hexo clean
hexo s
```

Site will be available at:

```
http://localhost:4000
```

---

## 📦 Deployment

Deployment is handled via **Hexo Git deployer**.

```bash
hexo clean
hexo g
hexo d
```

The site is automatically pushed to GitHub Pages.

---

## 📡 RSS Feed

An Atom feed is available for syndication and feed readers:

```
https://arenredd.github.io/atom.xml
```

---

## 📄 License

Content is published for educational purposes.

Code and configuration are open for reference and learning.
Reuse with attribution where applicable.

---

## 👤 Author

**Anandram Mohan (ArenRedd)**
Cybersecurity enthusiast, builder, and researcher.

* GitHub: [https://github.com/ArenRedd](https://github.com/ArenRedd)
* Blog: [https://arenredd.github.io](https://arenredd.github.io)

---

## ⚠️ Disclaimer

All content is intended for **educational and defensive security purposes only**.
No responsibility is taken for misuse of information.

```
