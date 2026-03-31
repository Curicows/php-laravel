# curicows/php-laravel

Public images for **Laravel** and other PHP apps: **PHP-FPM**, **Nginx**, useful PHP extensions, and optional **Node.js** / **Chromium** for building front-end assets and running browser tests (for example in CI).

**Quick start**

```bash
docker pull curicows/php-laravel:latest
```

**Platforms:** `linux/amd64`, `linux/arm64`

**Source:** [github.com/curicows/php-laravel](https://github.com/curicows/php-laravel) — Dockerfile, build workflow, and issues.

---

## What this image is

`curicows/php-laravel` is a convenience layer on top of the [serversideup/php](https://github.com/serversideup/docker-php) **fpm-nginx** images. It adds PHP extensions and optional Node or Chrome stacks so you can run or build PHP apps without assembling those pieces yourself.

## Base image (upstream)

All tags are built `FROM` [**serversideup/php**](https://github.com/serversideup/docker-php) using the **`{PHP}-fpm-nginx`** variant, for example:

- `serversideup/php:8.5-fpm-nginx`
- `serversideup/php:8.4-fpm-nginx`

That upstream image provides PHP-FPM and Nginx in one container (non-root friendly defaults; HTTP is served on port **8080** inside the container — see their docs for ports and environment variables).

## Variants

| Variant | Contents |
| ------- | -------- |
| **Base** | Extra PHP extensions: **exif**, **gd**, **intl**, **imagick**. User **`www-data`**, workdir **`/var/www/html`**. |
| **Node** | Base + **Node.js** (NodeSource), **npm**, **Yarn** global. |
| **Chrome** | Node variant + libraries for headless Chrome + **Chromium** via Puppeteer (`npx puppeteer browsers install chrome`). |

## Pull examples (Docker Hub)

Use these tags with `docker pull`, then reference the image in a `Dockerfile` `FROM`, **docker compose**, or `docker run`.

```bash
docker pull curicows/php-laravel:php-8.5
docker pull curicows/php-laravel:php-8.5-node-24
docker pull curicows/php-laravel:chrome-php-8.5-node-24
```

Pin a specific tag in production so upgrades are deliberate. For runtime behavior (ports, env vars, health checks), see [serversideup/php documentation](https://serversideup.net/open-source/docker-php/).

## Tags

Published tags follow this pattern (same tag names are also pushed to GitHub Container Registry — see below).

| Tag pattern | Description |
| ----------- | ----------- |
| `php-8.5`, `php-8.4` | Base: PHP-FPM + Nginx + extensions |
| `php-8.5-node-24`, `php-8.5-node-22`, `php-8.4-node-24`, `php-8.4-node-22` | Base + Node + Yarn |
| `chrome-php-8.5-node-24`, `chrome-php-8.5-node-22`, … | Node variant + Chromium (Puppeteer) |

**Aliases** (updated with the **PHP 8.5** + **Node 24** build):

| Alias | Meaning |
| ----- | ------- |
| `latest` | Base image from that build |
| `node` | Node variant |
| `chrome` | Chrome variant |

## GitHub Container Registry (mirror)

The same images are available as `ghcr.io/curicows/php-laravel` with identical tags, for example:

```bash
docker pull ghcr.io/curicows/php-laravel:latest
```
