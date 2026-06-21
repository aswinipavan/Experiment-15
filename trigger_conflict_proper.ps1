Set-Location C:\Users\aswin\.gemini\antigravity-ide\scratch\Experiment-15

# Reset main branch to sync with remote origin
git checkout main
git fetch origin
git reset --hard origin/main

# Delete existing local feature-branch if it exists
if (git branch --list "feature-branch") {
    git branch -D feature-branch
}

# 1. Create and checkout feature-branch
git checkout -b feature-branch
git config user.name "Developer"
git config user.email "developer@example.com"

# Overwrite README.md content on feature-branch
Set-Content -Path README.md -Value "# Experiment 15`n`nfeature-branch change: this line was added by the Feature Branch"
git add README.md
git commit -m "Updated file in feature branch"

# 2. Switch back to main
git checkout main
git config user.name "Maintainer"
git config user.email "maintainer@example.com"

# Overwrite README.md content on main differently to guarantee conflict
Set-Content -Path README.md -Value "# Experiment 15`n`nmain change: this line was added by the Main Branch"
git add README.md
git commit -m "Updated file in main branch"

# Push main changes to GitHub
git push origin main

# 3. Switch back to feature branch
git checkout feature-branch

# 4. Merge main (this will fail and trigger a conflict)
git merge main
