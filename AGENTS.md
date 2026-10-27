# AGENTS.md

Instructions for coding agents working on this repo (pablogarcor.com, a bilingual
Hugo site). Every command below has been run from the repo root.

## Rules

- Branch from `origin/main` and open the PR against `main`. `develop` is not used.
  Never merge or push to `main`.
- Use the Hugo binary, never Docker.
- Do not modify `scripts/` without a task of its own.
- Do not change the `slug` of a published post: it is its public URL.
- Do not add dependencies (npm, Go modules, Hugo themes or modules) without
  proposing it first.
- Do not commit generated output: `public/`, `build/`, `resources/`,
  `.hugo_build.lock`.

## Install

There are no project dependencies: no `package.json`, no `go.mod`, no theme.
The only requirement is Hugo **0.165.0**, the same version as the Docker image in
`scripts/` and in CI. The standard (non-extended) edition is enough: the site
uses no Sass/SCSS and no image processing.

Install it per version under `/srv/repos/.tools/` and call it by its full path:

```sh
cd "$(mktemp -d)"
curl -fsSLO https://github.com/gohugoio/hugo/releases/download/v0.165.0/hugo_0.165.0_linux-amd64.tar.gz
curl -fsSLO https://github.com/gohugoio/hugo/releases/download/v0.165.0/hugo_0.165.0_checksums.txt
grep ' hugo_0.165.0_linux-amd64.tar.gz$' hugo_0.165.0_checksums.txt | sha256sum -c -
tar -xzf hugo_0.165.0_linux-amd64.tar.gz hugo
mkdir -p /srv/repos/.tools/hugo-0.165.0
install -m 755 hugo /srv/repos/.tools/hugo-0.165.0/hugo
/srv/repos/.tools/hugo-0.165.0/hugo version   # hugo v0.165.0-76a5e188... linux/amd64
```

The commands below write `hugo` for short; use the full path above.

## Development

```sh
hugo server --noBuildLock
```

Serves the site from memory at http://localhost:1313/ (Spanish under
http://localhost:1313/es/) and reloads on changes. Stop it with Ctrl+C.

`scripts/run-web-server.sh` does the same inside Docker; agents do not use it.

## Build

Same command as CI (`.github/workflows/azure-static-web-apps-*.yml`):

```sh
hugo --minify --gc --enableGitInfo --noBuildLock
```

- Output goes to `public/` (git-ignored). Exit code 0 means the build is good.
- `--enableGitInfo` takes each post's last-modified date from git, so run it
  inside a git checkout.
- Two `WARN found no layout file for "html" for kind "taxonomy" / "term"` lines
  are expected: the site has no templates for those page kinds. Any `ERROR`
  line, or any deprecation warning, is a failure.
- `scripts/build-web.sh` runs the same build inside Docker. Agents do not use
  it; run the command above instead.

## Tests

There are no tests in this repo and CI does not run any. The check is that the
build above exits with code 0 and prints no `ERROR`.

## Lint

There is no linter configured (no Markdown, HTML or CSS lint) and CI does not
run one.

## Add a post

1. Pick the language and folder from the publication date:
   - English: `content/en/blog/yyyy/mm/dd/` → published at `/<slug>/`.
   - Spanish: `content/es/blog/yyyy/mm/dd/` → published at `/es/<slug>/`.
   Older posts use `yyyy/mm/` only; new ones use `yyyy/mm/dd/`.
2. Choose the format:
   - No images: a single file, e.g. `content/en/blog/2026/10/27/my-post.md`.
   - With images: a leaf bundle, a folder with `index.md` and the images in
     WebP next to it, e.g. `content/es/blog/2026/10/27/mi-post/index.md` and
     `.../mi-post/imagen.webp`, referenced as `![alt](imagen.webp)`.
3. Front matter (YAML). `slug` and `translationKey` are required:

   ```yaml
   ---
   title: "My post"
   date: 2026-10-27
   slug: "my-post"              # public URL; never change it once published
   translationKey: "my-post"    # same key in the post and its translation
   author: "Pablo García Ortega"
   tags: ["Tag"]
   description: "One sentence for search engines and link previews."
   ---
   ```

   A post and its translation share the `translationKey`; the language switcher
   in the header uses it. Unrelated posts must use different keys.
4. Build (see "Build") and check that `public/<slug>/index.html` (or
   `public/es/<slug>/index.html`) exists. The post also appears in the blog
   archive and, if it is among the 5 newest, on the home page.
5. Posts are reviewed and published by Pablo. Agents may draft them, but must not
   commit test posts.
