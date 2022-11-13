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

Start `rails server`, `tailwindcss:watch` and PostgreSQL:

```
docker-compose up
```

## Testing

Run unit tests:

```
docker-compose exec web bin/rails test
```

Run system tests:

```
docker-compose exec web bin/rails test:system
```
