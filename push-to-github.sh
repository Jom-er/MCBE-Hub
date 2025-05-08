#!/bin/bash

# Prompt for GitHub repo URL
read -p "Enter your GitHub repository URL (e.g., https://github.com/Jom-er/MCBE-Hub.git): " REPO_URL

# Initialize git if not already a repo
if [ ! -d .git ]; then
    git init
fi

# Set main as default branch
git branch -M main

# Add remote (if not already added)
if ! git remote | grep origin; then
    git remote add origin "$REPO_URL"
else
    git remote set-url origin "$REPO_URL"
fi

# Stage all changes
git add .

# Commit with timestamp
git commit -m "Auto push from Codespaces on $(date)" || echo "Nothing to commit."

# Push to GitHub
git push -u origin main