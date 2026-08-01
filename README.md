# pablogarcor.com

Source code for `pablogarcor.com`, a personal blog built with Hugo and a custom template.

The site is intentionally small: Markdown content, custom Hugo layouts, static CSS, favicon assets, and a Docker-based Hugo workflow. There is no npm build step and no external Hugo theme.

## Tech Stack

- Hugo static site generator
- Custom Hugo templates in `layouts/`
- Static CSS in `static/css/`
- Docker-based local build scripts using `hugomods/hugo:0.164.0`
- Azure Static Web Apps deployment through GitHub Actions

## Project Structure

```text
.
|-- config.toml
|-- content/
|   |-- en/
|   |   |-- about.md
|   |   |-- presentation.md
|   |   `-- blog/
|   |       |-- _index.md
|   |       `-- yyyy/mm/dd/
|   `-- es/
|       |-- about.md
|       |-- presentation.md
|       `-- blog/
|           |-- _index.md
|           `-- yyyy/mm/dd/
|-- layouts/
|   |-- home.html
|   |-- blog.html
|   |-- blog/single.html
|   `-- _partials/
|-- static/
|   |-- css/
|   `-- favicon/
|-- assets/
|   `-- logos/
|-- scripts/
`-- .github/workflows/
```

## Requirements

The included scripts require Docker.

They run Hugo through this image:

```text
hugomods/hugo:0.164.0
```

If you prefer not to use Docker, install a compatible Hugo version locally and run the equivalent Hugo commands.

## Dependency Manifests

This project intentionally does not have a `package.json`, `go.mod`, or equivalent dependency manifest.

That is the right default for the current architecture because the site does not use Node.js tooling, Hugo modules, a third-party theme, Sass/PostCSS, or a JavaScript bundler. The source of truth for local commands is the `scripts/` directory, and Hugo runs through Docker with a pinned image version.

Add a manifest only when the project actually needs one:

- Add `package.json` if a real Node-based asset pipeline is introduced.
- Add `go.mod` if the site starts using Hugo Modules.
- Do not add a package manager file only to wrap the existing shell scripts.

## Local Development

Start the Hugo development server:

```bash
./scripts/run-web-server.sh
```

Open:

```text
http://localhost:1313
```

The script renders the site in memory, binds Hugo to `0.0.0.0` inside Docker, and maps port `1313`.

## Build

Create a production build:

```bash
./scripts/build-web.sh
```

The build script runs Hugo with minification, garbage collection, Git info, and no build lock:

```bash
hugo --minify --gc --enableGitInfo --noBuildLock
```

Then it moves generated output into:

```text
build/public
build/resources
```

Generated build output should not be committed.

## Content

General site pages live in each language directory under `content/`:

- `content/en/presentation.md`: English homepage introduction.
- `content/en/about.md`: English homepage about section.
- `content/en/blog/_index.md`: English blog section using the custom `blog` layout.
- Spanish equivalents live under `content/es/`.

Blog posts live under `content/<language>/blog/` using a date-based path:

```text
content/en/blog/yyyy/mm/dd/
```

For posts without images, use a Markdown file:

```text
content/en/blog/2026/05/18/example-post.md
```

For posts with images, use a Hugo leaf bundle:

```text
content/en/blog/2026/05/18/index.md
content/en/blog/2026/05/18/example-image.webp
```

Example post front matter:

```yaml
---
title: "Example Post"
date: 2026-05-18
slug: "example-post"
translationKey: "example-post"
author: "Pablo Garcia Ortega"
tags: ["Hugo", "Web Development"]
description: "Short description for search engines and previews."
---
```

The `slug` is important because `config.toml` publishes blog posts at:

```toml
[permalinks]
  blog = "/:slug/"
```

Every blog post must define a `translationKey`. Independent posts use different keys; true translations reuse exactly the same key across languages. Hugo uses `translationKey` to pair translated pages, while `slug` controls the public URL and should remain stable.

## Templates And Styling

The site uses custom templates instead of a theme:

- `layouts/home.html`: homepage.
- `layouts/blog.html`: blog archive grouped by year.
- `layouts/blog/single.html`: single post page.
- `layouts/_partials/header.html`: main navigation.
- `layouts/_partials/latest-posts.html`: five latest posts on the homepage.
- `layouts/_partials/contact.html`: contact block.
- `layouts/_partials/footer.html`: footer and Hugo logo.

CSS is served directly from `static/css/`:

- `style.css`: global layout and typography.
- `header.css`: navigation and title behavior.
- `blog.css`: blog listing styles.
- `latest-posts.css`: latest posts styles.
- `contact.css`: contact block styles.

## Deployment

Deployment is handled by Azure Static Web Apps through the workflow in `.github/workflows/`.

The workflow runs on:

- Pushes to `main`.
- Pull requests targeting `main`.

Current Azure build configuration:

```yaml
app_location: "public"
api_location: ""
output_location: ""
skip_app_build: true
```

## Notes

- Keep generated directories such as `public/`, `resources/`, and `build/` out of commits.
- Keep the project dependency-free unless a new dependency is explicitly needed.
- Prefer WebP images for post assets, matching the existing posts.
