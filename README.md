# pablogarcor.com

Source code for `pablogarcor.com`, a personal blog built with Hugo and a custom template.

The site is intentionally small: Markdown content, custom Hugo layouts, static CSS, favicon assets, and a Docker-based Hugo workflow. There is no npm build step and no external Hugo theme.

## Tech Stack

- Hugo static site generator
- Custom Hugo templates in `layouts/`
- Static CSS in `static/css/`
- Docker-based local build scripts using `hugomods/hugo:0.122.0`
- Azure Static Web Apps deployment through GitHub Actions

## Project Structure

```text
.
|-- config.toml
|-- content/
|   |-- _index.md
|   |-- about.md
|   |-- blog.md
|   |-- presentation.md
|   `-- blog/
|       `-- yyyy/mm/dd/
|-- layouts/
|   |-- index.html
|   |-- blog/single.html
|   |-- page/blog.html
|   `-- partials/
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
hugomods/hugo:0.122.0
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

The script binds Hugo to `0.0.0.0` inside Docker and maps port `1313`.

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

General site pages live in `content/`:

- `content/presentation.md`: homepage introduction.
- `content/about.md`: homepage about section.
- `content/blog.md`: blog listing page using the custom `blog` layout.

Blog posts live under `content/blog/` using a date-based path:

```text
content/blog/yyyy/mm/dd/
```

For posts without images, use a Markdown file:

```text
content/blog/2026/05/18/example-post.md
```

For posts with images, use a Hugo leaf bundle:

```text
content/blog/2026/05/18/index.md
content/blog/2026/05/18/example-image.webp
```

Example post front matter:

```yaml
---
title: "Example Post"
date: 2026-05-18
slug: "example-post"
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

## Templates And Styling

The site uses custom templates instead of a theme:

- `layouts/index.html`: homepage.
- `layouts/page/blog.html`: blog archive grouped by year.
- `layouts/blog/single.html`: single post page.
- `layouts/partials/header.html`: main navigation.
- `layouts/partials/latest-posts.html`: five latest posts on the homepage.
- `layouts/partials/contact.html`: contact block.
- `layouts/partials/footer.html`: footer and Hugo logo.

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
app_location: "/"
api_location: ""
output_location: "public"
```

## Notes

- Keep generated directories such as `public/`, `resources/`, and `build/` out of commits.
- Keep the project dependency-free unless a new dependency is explicitly needed.
- Prefer WebP images for post assets, matching the existing posts.
