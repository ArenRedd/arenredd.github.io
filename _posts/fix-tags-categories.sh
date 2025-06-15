#!/bin/bash

echo "🔧 Starting mass replacement of tags and categories..."

# Define replacements as "original=new"
declare -a replacements=(
  "Docker=docker"
  "Kali Linux=kali-linux"
  "Arch Linux=arch-linux"
  "Linux=linux"
  "GRUB=grub"
  "Customization=customization"
  "Python=python"
  "WSL=wsl"
  "GitHub=github"
  "TempleOS=templeos"
  "VirtualBox=virtualbox"
  "AI Revolution=ai-revolution"
  "Ethics=ethics"
  "Cyber Journal=cyber-journal"
  "Linux Life=linux-life"
  "Dev Journal=dev-journal"
  "System Customization=system-customization"
  "Debugging=debugging"
  "Crypto Lab=crypto-lab"
  "Blog Dev=blog-dev"
  "Jekyll=jekyll"
  "GitHub Pages=github-pages"
  "Docker Projects=docker-projects"
  "Self-Hosting=self-hosting"
  "Web Projects=web-projects"
  "Troubleshooting=troubleshooting"
  "Hacking Guides=hacking-guides"
  "Hacker Tools=hacker-tools"
  "Cybersecurity=cybersecurity"
)

# Iterate through each .md file in the current directory
for file in *.md; do
  echo "📝 Processing $file"
  for entry in "${replacements[@]}"; do
    original=$(echo "$entry" | cut -d '=' -f 1)
    new=$(echo "$entry" | cut -d '=' -f 2)

    # Replace both quoted and unquoted tags/categories
    sed -i "s/\"$original\"/$new/g" "$file"
    sed -i "s/'$original'/$new/g" "$file"
    sed -i "s/\b$original\b/$new/g" "$file"
  done
done

echo "✅ Replacement complete. You can now rebuild your site."