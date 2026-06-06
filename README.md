# Student CRM (Java + PostgreSQL)

Spring Boot CRM for education agencies — students, applications, universities, and programs.

## Requirements

- Java 17
- PostgreSQL (local) or Railway Postgres

## Default test login

On first startup the app creates a single administrator if none exists:

| Field | Value |
|-------|-------|
| Username | `admin` |
| Password | `admin123` |

Override with `APP_BOOTSTRAP_ADMIN_EMAIL` and `APP_BOOTSTRAP_ADMIN_PASSWORD` if needed.

## Pre-loaded data

Flyway migrations seed **universities and programs only** (~4,900 programs). No students, applications, agents, or other user data is included.

## Run locally

```bash
export DATABASE_URL=postgresql://postgres:postgres@localhost:5432/student_crm
mvn spring-boot:run
```

Open `http://localhost:8080` and sign in with `admin` / `admin123`.

## Deploy on Railway

1. Create a **PostgreSQL** service on Railway.
2. Deploy this repo using the included `Dockerfile`.
3. Link `DATABASE_URL` from the Postgres service to the app service.
4. Railway sets `PORT` automatically — no extra config required.

Optional environment variables:

| Variable | Purpose |
|----------|---------|
| `APP_META_SITE_NAME` | Brand name shown in the UI (default: `Student CRM`) |
| `APP_BOOTSTRAP_ADMIN_EMAIL` | First admin username (default: `admin`) |
| `APP_BOOTSTRAP_ADMIN_PASSWORD` | First admin password (default: `admin123`) |
| `SPRING_FLYWAY_ENABLED` | Set to `false` after schema is migrated for faster boots |
| `TELEGRAM_BOT_TOKEN` | Telegram bot token for lead assignment notifications |
| `WHATSAPP_ACCESS_TOKEN` | Meta WhatsApp Cloud API access token |
| `WHATSAPP_PHONE_NUMBER_ID` | WhatsApp phone number ID from Meta Business |
| `WHATSAPP_BUSINESS_ACCOUNT_ID` | WhatsApp Business Account ID |
| `WHATSAPP_DISPLAY_PHONE` | Display phone number (e.g. `+15556518995`) |
| `WHATSAPP_WEBHOOK_VERIFY_TOKEN` | Verify token for Meta webhook subscription |
| `WHATSAPP_TEST_PHONE` | Recipient phone for `/api/test-whatsapp/send` (E.164, digits only) |

## Authentication

- Users are stored in the `app_user` table.
- Login uses the username field (email-style or plain username).
- Admin users have role `ADMIN` and full access to agents, services, and catalog management.
