# Pharmacy Reminder System

Internal Rails app for tracking customers, prescriptions, and upcoming delivery dates for a pharmacy shop.

## Local setup

```bash
bundle install
bin/rails db:create db:migrate db:seed
bin/dev
```

Default seeded admin:

- Email: `admin@pharmacy.local`
- Password: `ChangeMe123!`

## Render deployment

This app is configured to deploy on Render as a Docker web service with PostgreSQL.

Files used for Render:

- `render.yaml`
- `Dockerfile`
- `bin/docker-entrypoint`

Production is configured to use:

- a single Render PostgreSQL database via `DATABASE_URL`
- Docker runtime on Render
- `puma` as the container web server
- `memory_store` cache
- `async` Active Job and Action Cable adapters
- Render `starter` web service and `basic-256mb` PostgreSQL plans in the included blueprint

### Deploy with Render Blueprint

1. Push the app to GitHub.
2. In Render, choose `New +` then `Blueprint`.
3. Select the repository.
4. Add the `RAILS_MASTER_KEY` environment variable in Render.
5. Deploy the blueprint.

Render will automatically:

- create the PostgreSQL database
- build the Docker image from `Dockerfile`
- boot the container with Puma
- run `db:prepare` from the Docker entrypoint on startup

### Required environment variables

- `RAILS_MASTER_KEY`
- `DATABASE_URL`

`DATABASE_URL` is populated automatically by Render when deploying from `render.yaml`.
