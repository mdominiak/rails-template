# Rails Template

The main goal is to provide Rails 7 application with working user registration and authentication (Devise) and TailwindCSS dark theme.

The rails template comes preconfigured with:

- Rails 7 on Ruby 3
- PostgreSQL
- TailwindCSS dark theme
- Devise with test coverage
- MiniTest/FactoryBot
- Dockerfile for quick and easy development environment setup

## Development

Start the development environment:

```
docker-compose up
```

The following services are configured in [docker-compose.yml](docker-compose.yml):
* `web` from [Dockerfile](Dockerfile) image running `rails server` exposing web application on host at http://localhost:3000
* `css` from [Dockerfile](Dockerfile) image running `rails tailwindcss:watch` compiling [TailwindCSS](https://tailwindcss.com/docs/guides/ruby-on-rails) stylesheets
* `postgres` from [posgres](https://hub.docker.com/_/postgres) image

### Initial setup

Create `development` and `test` databases:

```
docker-compose exec web rails db:create
```

Load the database schema:
```
docker-compose exec web rails db:schema:load
```

## Testing

Run unit tests:

```
docker-compose exec web rails test
```

Run system tests:

```
docker-compose exec web rails test:system
```

## Deployment

Build production docker image for deployment:

```
docker build -f production.Dockerfile -t rails-auth-production .
```

Test production image locally:

```
docker run -p 3000:3000 --name rails-auth-production --rm -e DATABASE_URL=postgres://rails_auth_production:secret@host.docker.internal/rails_auth_production rails-auth-production
docker exec rails-auth-production rails db:schema:load
ngrok http 3000
```
