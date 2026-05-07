# Publishing Guide

Everything you (or Claude) need to know about how this site gets from your laptop to the internet.

---

## How publishing works

This site uses a fully automated pipeline:

```
You push to GitHub  →  GitHub Actions builds the site  →  Netlify publishes it
```

You never need to log into Netlify, run a build command, or do anything manual. Every time a commit lands on the `main` branch, the site redeploys automatically within about 60 seconds.

---

## Day-to-day: how to publish a change

1. Tell Claude what you want changed (or drop photos into the right folder).
2. Claude makes the change.
3. Claude commits and pushes to GitHub.
4. Wait ~60 seconds. Your live site is updated.

That's the whole workflow. Nothing else is required.

---

## Adding or updating photos

Photos live in `src/content/galleries/`. Each gallery is a subfolder named after its slug:

```
src/content/galleries/
├── creative-portraits/
├── events/
├── children/
└── personal-projects/
```

**To add photos to an existing gallery:** drop `.jpg` or `.png` files into the right subfolder, then ask Claude to commit and push.

**To control the order photos appear:** prefix filenames with numbers — `01-portrait.jpg`, `02-portrait.jpg`, etc. Without numeric prefixes, photos are sorted alphabetically.

**To create a new gallery:**
1. Create a new folder under `src/content/galleries/` (lowercase, hyphens for spaces — e.g. `weddings`).
2. Drop photos in.
3. Add an entry to `src/data/galleries.json`:
   ```json
   { "slug": "weddings", "title": "Weddings", "description": "One sentence." }
   ```
4. Ask Claude to commit and push.

**Photo file guidelines:**
- Format: `.jpg` (preferred) or `.png`. Never `.NEF`, `.CR2`, `.ARW` (RAW files) — they are huge and the build system cannot process them.
- Target size: under 2 MB per image. Astro optimizes images at build time, but huge source files make builds slow and may exceed GitHub's 100 MB per-file limit.
- Filename: lowercase, hyphens instead of spaces, no apostrophes or special characters. Example: `anna-portrait-2024.jpg`.

---

## The technical pipeline in detail

### 1. GitHub repository

**Repo:** `https://github.com/annakreslavskaya-bit/anna-photography`  
**Branch:** `main` (only branch — all work goes here)

The repo stores the complete site: all source code, all photos, all content. GitHub is the source of truth.

### 2. GitHub Actions (`.github/workflows/deploy.yml`)

When a commit is pushed to `main`, GitHub runs this workflow automatically:

1. Checks out the code.
2. Installs Node 20.
3. Runs `npm ci` (installs dependencies from `package-lock.json`).
4. Runs `npm run build` (Astro compiles the site into the `dist/` folder).
5. Uses the `nwtgck/actions-netlify` action to upload `dist/` to Netlify as a production deploy.

The workflow uses two **GitHub Secrets** (stored in repo Settings → Secrets and variables → Actions):

| Secret name | What it is |
|---|---|
| `NETLIFY_AUTH_TOKEN` | A personal access token from your Netlify account |
| `NETLIFY_SITE_ID` | The unique ID of your site on Netlify |

These secrets are already configured. You never need to touch them unless you reconnect to a different Netlify site.

### 3. Netlify

**Platform:** [app.netlify.com](https://app.netlify.com)  
**Build trigger:** GitHub Actions (not Netlify's own CI — Netlify just receives the built files)  
**Publish directory:** `dist/`

Netlify hosts the final compiled site and serves it to the world. It handles SSL (HTTPS), global CDN, and custom domain routing.

---

## Checking a deploy

After pushing, you can see the deploy status two ways:

**On GitHub:**  
Go to `https://github.com/annakreslavskaya-bit/anna-photography/actions`. The latest run shows `in progress` → `success` (or `failure` with error logs).

**Via command line (if Claude is in a session):**
```bash
~/bin/gh run list --limit 5
```

---

## If a deploy fails

1. Go to GitHub → Actions → click the failed run → read the error.
2. Common causes:
   - **Build error** — a code change broke something. Claude can diagnose from the error log.
   - **Photo too large** — a single image over 100 MB will break the git push. Resize it first.
   - **Missing secret** — if `NETLIFY_AUTH_TOKEN` or `NETLIFY_SITE_ID` is missing or expired, the deploy step will fail. See "Re-adding Netlify secrets" below.

---

## Re-adding Netlify secrets (if needed)

If you ever need to reconnect the deploy pipeline (e.g. after creating a new Netlify site or rotating your token):

### Get your Netlify auth token

```bash
cat ~/Library/Preferences/netlify/config.json
```

Look for the `"token"` value. This is your personal access token.

Alternatively: log into [app.netlify.com](https://app.netlify.com) → User settings → Applications → Personal access tokens → Create new token.

### Get your Netlify site ID

```bash
cat ~/Documents/anna-photography/netlify.toml
```

Or: log into Netlify → your site → Site configuration → Site ID.

### Set the secrets on GitHub

```bash
~/bin/gh secret set NETLIFY_AUTH_TOKEN --body "your-token-here" \
  --repo annakreslavskaya-bit/anna-photography

~/bin/gh secret set NETLIFY_SITE_ID --body "your-site-id-here" \
  --repo annakreslavskaya-bit/anna-photography
```

---

## Setting up a custom domain

When you're ready to use your own domain (e.g. `annakreslavskaya.com`):

### Step 1 — Buy a domain

Any registrar works: [Namecheap](https://namecheap.com), [Porkbun](https://porkbun.com), [Google Domains](https://domains.google), [Squarespace Domains](https://domains.squarespace.com).

### Step 2 — Add the domain to Netlify

1. Log into [app.netlify.com](https://app.netlify.com).
2. Go to your site → **Domain management** → **Add custom domain**.
3. Enter your domain. Netlify will give you DNS instructions (usually a CNAME record pointing `www` to Netlify, and either an A record or ALIAS/ANAME for the root).

### Step 3 — Update DNS at your registrar

Log into wherever you bought the domain and add the records Netlify specified. DNS changes propagate in 5 minutes to 48 hours (usually under an hour).

### Step 4 — Update the site URL in code

Edit `astro.config.mjs`, line 4 — replace the placeholder with your real domain:

```js
site: 'https://annakreslavskaya.com',
```

### Step 5 — Enable www redirect (optional)

In `netlify.toml`, uncomment and update the redirect block at the bottom:

```toml
[[redirects]]
  from = "https://www.annakreslavskaya.com/*"
  to   = "https://annakreslavskaya.com/:splat"
  status = 301
  force  = true
```

### Step 6 — Commit and push

```bash
git add astro.config.mjs netlify.toml
git commit -m "Set custom domain"
git push
```

Netlify will automatically provision a free SSL certificate (HTTPS) once DNS resolves.

---

## Local preview (for Claude sessions)

To preview the site locally before publishing:

```bash
source ~/.nvm/nvm.sh   # load Node (only needed in terminal sessions)
cd ~/Documents/anna-photography
npm run dev
```

Open `http://localhost:4321` in your browser. Changes appear instantly as files are saved.

To do a full production build locally (same as what GitHub Actions runs):

```bash
npm run build
```

---

## Tools installed on this machine

| Tool | Location | Purpose |
|---|---|---|
| Node.js (v20) | via `nvm` at `~/.nvm/` | Runs Astro, builds the site |
| npm | bundled with Node | Installs packages |
| git | system | Version control |
| GitHub CLI (`gh`) | `~/bin/gh` | Manage GitHub from terminal |
| nvm | `~/.nvm/` | Manages Node versions |

To use `gh` or `node` in a new terminal session, run `source ~/.nvm/nvm.sh` first (or Claude will do this automatically).

---

## Repository layout (quick reference)

```
anna-photography/
├── .github/workflows/deploy.yml   ← GitHub Actions deploy pipeline
├── netlify.toml                   ← Netlify build settings + domain redirects
├── astro.config.mjs               ← Site URL, image config
├── package.json                   ← Project dependencies
├── src/
│   ├── content/galleries/         ← Drop photos here (one folder per gallery)
│   ├── data/galleries.json        ← Gallery titles, slugs, site name/tagline
│   ├── pages/
│   │   ├── index.astro            ← Homepage
│   │   ├── [gallery].astro        ← Gallery pages (auto-generated)
│   │   └── about.astro            ← About / bio / contact
│   ├── components/
│   │   ├── Navigation.astro       ← Top nav
│   │   └── Gallery.astro          ← Grid + lightbox
│   ├── layouts/BaseLayout.astro   ← HTML shell, fonts, meta tags
│   └── styles/global.css          ← All CSS (theme variables at top)
├── AGENTS.md                      ← Instructions for Claude
├── PUBLISHING.md                  ← This file
└── download-photos.sh             ← Script used to migrate photos from Squarespace
```
