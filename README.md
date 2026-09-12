# Flask + MySQL Docker Application

This repository runs the tutorial Flask application and MySQL database locally with Docker Compose.

## Prerequisites

- Docker with Compose v2
- A local `.env` file based on `.env.example`

Create the local environment file:

```sh
cp .env.example .env
```

Use strong, local-only values for `MYSQL_ROOT_PASSWORD`, `MYSQL_DATABASE_PASSWORD`, and `FLASK_SECRET_KEY`. The `.env` file is ignored by Git.

## Run Locally

```sh
docker compose up --build
```

Open <http://localhost:5000>. Stop the stack with `Ctrl+C`, or run `docker compose down` from another terminal.

MySQL data is stored in the named `mysql_data` volume. The initialization script in `database/init/` runs when that volume is created. To reset the database completely:

```sh
docker compose down -v
```

The Compose file uses `host.docker.internal` for the database connection because nested Docker networking is restricted in this Codespaces environment. On a normal Docker host, the app should use the Compose service name `db` instead.

## Security

The Flask container runs as a non-root user with a read-only root filesystem. Both containers drop Linux capabilities, prevent privilege escalation, limit processes and memory, and use health checks. Secrets are supplied through environment variables and are not copied into images.

## Trivy Scan

Build the images and scan both of them:

```sh
docker compose build
./scan-images.sh
```

The script reports HIGH and CRITICAL vulnerabilities from both images. Trivy is informational in the current GitHub Actions workflow, so findings are visible without blocking the pipeline. Exit code `0` means the scan command completed; it does not mean the images have zero findings.

## GitHub Actions and Releases

The workflow in `.github/workflows/container-ci.yml` runs on pull requests, pushes to `main`, and version tags. It builds both images, runs Trivy, and publishes images to GitHub Container Registry for tags matching `v*.*.*`.

After changes are merged and the working tree is clean:

```sh
git checkout main
git pull --ff-only
git tag v1.0.0
git push origin v1.0.0
```

The images are published under the repository's GitHub Container Registry namespace with the release tag.

## Branching Workflow

Create a feature branch from `main`, make one focused change, test it, push it, and open a pull request. Merge only after review and successful CI. Keep `main` protected from direct pushes and force pushes.
