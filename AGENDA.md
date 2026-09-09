# Project Agenda

- Inspect and understand the existing Flask application. [done]
- Identify Python dependencies and database requirements. [done]
- Add a dependency file for the Flask application. [done]
- Move database settings and Flask secrets to environment variables. [done]
- Fix the existing Flask issues needed for reliable startup. [done]
- Create the MySQL schema and initialization scripts. [done]
- Create the Flask application Dockerfile. [done]
- Create the MySQL Dockerfile.
- Create `docker-compose.yml` with networking, health checks, and persistence.
- Run and test the complete application locally with Docker Compose.
- Add container hardening and scan both images with Trivy.
- Add GitHub Actions CI, tagged image builds, documentation, and branching workflow.