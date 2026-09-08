# Project Agenda

- Inspect and understand the existing Flask application. [done]
- Identify Python dependencies and database requirements.
- Add a dependency file for the Flask application.
- Move database settings and Flask secrets to environment variables.
- Fix the existing Flask issues needed for reliable startup.
- Create the MySQL schema and initialization scripts.
- Create the Flask application Dockerfile.
- Create the MySQL Dockerfile.
- Create `docker-compose.yml` with networking, health checks, and persistence.
- Run and test the complete application locally with Docker Compose.
- Add container hardening and scan both images with Trivy.
- Add GitHub Actions CI, tagged image builds, documentation, and branching workflow.