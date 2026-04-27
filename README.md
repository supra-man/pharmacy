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

This app is configured to deploy on Render as a Ruby web service with PostgreSQL.

Files added for Render:

- `render.yaml`
- `Procfile`
- `bin/render-build.sh`

Production is configured to use:

- a single Render PostgreSQL database via `DATABASE_URL`
- `puma` as the web server
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
- install gems and precompile assets
- run `bundle exec rails db:migrate`
- boot the app with Puma

### Required environment variables

- `RAILS_MASTER_KEY`
- `DATABASE_URL`

`DATABASE_URL` is populated automatically by Render when deploying from `render.yaml`.
