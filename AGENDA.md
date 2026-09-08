# Flask + MySQL Containerization Agenda

This project is intentionally split into small milestones. Each completed milestone should be explained, tested, and committed separately. We will keep `main` stable and do the work on a feature branch, then merge through a pull request.

## Phase 1: Understand the Starting Application

- [ ] 1. Inventory the existing repository and identify the application entry point.
- [ ] 2. Read the Flask routes, templates, and static files.
- [ ] 3. Identify the Python packages the application needs.
- [ ] 4. Identify every database table, column, and stored procedure the code expects.
- [ ] 5. Document the current application assumptions and known defects.

## Phase 2: Make the Application Reproducible

- [ ] 6. Add a pinned Python dependency file.
- [ ] 7. Move database settings into environment variables.
- [ ] 8. Move the Flask secret key into an environment variable.
- [ ] 9. Fix the application connection and cursor lifecycle.
- [ ] 10. Fix missing imports, route mismatches, and local startup issues.
- [ ] 11. Add a simple health endpoint for container checks.
- [ ] 12. Add a local configuration example without real secrets.

## Phase 3: Build the Database Layer

- [ ] 13. Design the minimal local-development database schema.
- [ ] 14. Write the initial database and table creation script.
- [ ] 15. Add the stored procedures required by signup and login.
- [ ] 16. Add safe database initialization ordering and character encoding.
- [ ] 17. Verify initialization against a clean MySQL instance.

## Phase 4: Containerize the Application

- [ ] 18. Choose and pin a suitable Python base image.
- [ ] 19. Write the Flask application Dockerfile.
- [ ] 20. Add a non-root application user.
- [ ] 21. Add a `.dockerignore` file.
- [ ] 22. Build the Flask image locally.
- [ ] 23. Run the Flask image with a temporary configuration.
- [ ] 24. Choose and pin a suitable MySQL base image.
- [ ] 25. Write the MySQL Dockerfile and copy initialization scripts.
- [ ] 26. Build and test the MySQL image locally.

## Phase 5: Compose the Local Environment

- [ ] 27. Define the Flask and MySQL services in `docker-compose.yml`.
- [ ] 28. Connect the services through the Compose network using the database service name.
- [ ] 29. Add health checks and make Flask wait for a healthy database.
- [ ] 30. Add a named volume for persistent MySQL data.
- [ ] 31. Add local secret configuration and ensure it is ignored by Git.
- [ ] 32. Start the complete environment with `docker compose up`.
- [ ] 33. Test signup, login, protected pages, and logout end to end.

## Phase 6: Harden and Automate

- [ ] 34. Add container resource, privilege, and filesystem hardening that fits local development.
- [ ] 35. Add image metadata, predictable names, and reproducible version inputs.
- [ ] 36. Install and run Trivy scans against both built images.
- [ ] 37. Add GitHub Actions pull-request checks for build and Trivy scanning.
- [ ] 38. Add tagged-release automation for building and publishing versioned images.
- [ ] 39. Document branching, commits, startup, troubleshooting, and security practices.
- [ ] 40. Perform a clean-machine test, review the assignment checklist, and merge through a pull request.

## Commit Rule

Each milestone should have one focused commit with a message that explains the change, for example:

```text
docs: add containerization learning agenda
```

Before each commit:

1. Explain what changed and why.
2. Run the smallest useful validation.
3. Review the diff.
4. Commit only the files for that milestone.
