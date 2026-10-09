# Suraksha Dal Security Force — React Single Page Website

A responsive React + Vite redesign with `src/App.jsx`, detailed sections, interactions, and local image paths under `public/images/`.

## Run locally

```bash
npm install
npm run dev
```

## Populate the local image folder (Windows)

The source environment used to prepare this ZIP did not have outbound network access, so binary photos and certificate scans could not be pre-downloaded into the archive. To fetch them on your own Windows computer, run:

```powershell
npm run assets:download
```

This script downloads five certificate/gallery scans and the certificate PDF from the Suraksha Dal website, plus real photographs hosted by other security-service websites, into `public/images/`. The React website itself references only `/images/...` local paths; it does not load those photographs from remote URLs at runtime. If an image download fails, retry the script or add the file manually with the expected filename.

## Before publishing

- Check each downloaded file in `public/images/` and replace stock/reference photographs with company-approved images where possible.
- Confirm permission to reuse third-party photographs; the downloader's URLs are sources, not a guarantee of reuse rights.
- Confirm certificate validity and permission before presenting documents as current credentials.
- The source website's published content contains claims and figures; validate them with the company before relying on them commercially.
- The enquiry form is front-end only and does not send/store submissions. Connect it to a backend or form provider before launch.
- The website source uses system fonts and local image paths, so no third-party images or web fonts are requested at runtime.
