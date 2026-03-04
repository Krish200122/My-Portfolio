# 🚀 Firebase + GitHub Auto-Deploy Setup Guide

## Step 1 — Create Firebase Project

1. Go to https://console.firebase.google.com
2. Click **Add Project** → name it (e.g. `KrishPortfolio-portfolio`)
3. Disable Google Analytics (optional) → **Create Project**
4. In the left sidebar → **Hosting** → **Get Started**
5. Copy your **Project ID** (e.g. `KrishPortfolio-portfolio`)

---

## Step 2 — Update .firebaserc

Open `.firebaserc` and replace `YOUR_FIREBASE_PROJECT_ID` with your actual project ID:
```json
{
  "projects": {
    "default": "KrishPortfolio-portfolio"
  }
}
```

---

## Step 3 — Generate Firebase Service Account

1. Firebase Console → Project Settings (⚙️) → **Service Accounts**
2. Click **Generate new private key** → Download the JSON file
3. Open the JSON file — copy the **entire contents**

---

## Step 4 — Add GitHub Secrets

Go to your GitHub repo → **Settings** → **Secrets and variables** → **Actions** → **New repository secret**

Add these 2 secrets:

| Secret Name | Value |
|-------------|-------|
| `FIREBASE_SERVICE_ACCOUNT` | Paste the entire JSON content from Step 3 |
| `FIREBASE_PROJECT_ID` | Your Firebase project ID (e.g. `KrishPortfolio-portfolio`) |

---

## Step 5 — Push to GitHub

```bash
git init
git add .
git commit -m "Initial portfolio deploy"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git
git push -u origin main
```

GitHub Actions will automatically trigger and deploy to Firebase Hosting! ✅

---

## Step 6 — Connect Custom Domain (optional)

1. Firebase Console → Hosting → **Add custom domain**
2. Enter your domain (e.g. `KrishPortfolio.web.app`)
3. Add the DNS records shown to your domain registrar
4. Wait for SSL certificate (auto-provisioned, ~24h)

---

## How Auto-Deploy Works

```
You push to main
       ↓
GitHub Actions triggers (.github/workflows/firebase-deploy.yml)
       ↓
Deploys your site to Firebase Hosting (live channel)
       ↓
Site is live at https://YOUR_PROJECT_ID.web.app
```

For Pull Requests → auto creates a **preview URL** so you can review before merging.
