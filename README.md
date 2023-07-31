# Rails Template

## Development

Following the [prereq of portals](https://github.ibm.com/skills-network/portals/blob/master/docs/developing-native.md#prerequisites).

### Secrets

Follow the prereq section in https://wiki.skills.network/en/Team/how-to-config-secrets-for-development#prerequisite

Run the command below the decrypt the secret file

```bash
./bin/decrypt config/settings/development.local.yaml
```

### Install dependencies

Install Ruby dependencies

```bash
bundle install
```

### Setup environment

```bash
cp .env.development.example .env.development
source .env.development
```

## Database

### Start database

```bash
docker compose up -d
```

This will create appropriate Docker volumes, container(s), and create the template PostgreSQL database.

### Migration

This should only be used for a fresh database

```bash
bin/rails db:schema:load
```

Otherwise run the command below instead

```bash
bin/rails db:migrate
```

## Run the dev server

```bash
rbenv shell 3.1.2
bin/dev
```

Then open http://localhost:3000

## Merging

Prior to merging your branch ensure that it runs `bundle exec rubocop` clean