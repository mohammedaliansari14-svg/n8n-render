# n8n on Render

This repository contains the configuration to self-host n8n on Render.

## Quick Deploy

### Option 1: One-Click Deploy (Recommended)

[![Deploy to Render](https://render.com/images/deploy-to-render-button.svg)](https://render.com/deploy)

Click the button above and:
1. Connect your GitHub/GitLab account
2. Give your service a name (e.g., `n8n`)
3. Set the environment variables:
   - `N8N_BASIC_AUTH_USER` - Your login username
   - `N8N_BASIC_AUTH_PASSWORD` - Your login password
   - `WEBHOOK_URL` - Update this to match your service name: `https://n8n-YOUR_SERVICE_NAME.onrender.com/`
4. Click "Deploy"

### Option 2: Manual Deploy

1. Create a new **Web Service** on Render
2. Connect this repository
3. Select **Docker** as the runtime
4. Add a **PostgreSQL database** (required for persistence)
5. Set the following environment variables:

| Variable | Description | Example |
|----------|-------------|---------|
| `DB_TYPE` | Database type | `postgresdb` |
| `DB_POSTGRESDB_HOST` | Database host | From Render database |
| `DB_POSTGRESDB_DATABASE` | Database name | `n8n` |
| `DB_POSTGRESDB_USER` | Database user | From Render database |
| `DB_POSTGRESDB_PASSWORD` | Database password | From Render database |
| `N8N_BASIC_AUTH_USER` | n8n login username | `admin` |
| `N8N_BASIC_AUTH_PASSWORD` | n8n login password | `your-secure-password` |
| `WEBHOOK_URL` | Public webhook URL | `https://n8n-xyz.onrender.com/` |
| `GENERIC_TIMEZONE` | Timezone | `UTC` or `America/New_York` |
| `N8N_ENCRYPTION_KEY` | Encryption key for credentials | Auto-generated |

6. Add a **Disk** for persistence:
   - Mount path: `/home/node/.n8n`
   - Size: 1 GB minimum

7. Deploy!

## After Deployment

- Access n8n at: `https://your-service-name.onrender.com`
- Login with the credentials you set in `N8N_BASIC_AUTH_USER` and `N8N_BASIC_AUTH_PASSWORD`

## Important Notes

1. **Free tier limitations**: Render free web services spin down after 15 minutes of inactivity. They take ~30 seconds to wake up.

2. **Webhooks**: Make sure `WEBHOOK_URL` is set correctly or webhooks won't work.

3. **Persistence**: This setup uses both PostgreSQL (database) and a Render Disk (files/executions) for full persistence.

4. **Security**: Always change the default password and keep `N8N_ENCRYPTION_KEY` secret - it's used to encrypt your credentials.

## Troubleshooting

- **Service won't start**: Check the logs for database connection issues
- **Webhooks not working**: Verify `WEBHOOK_URL` matches your actual Render URL
- **Data loss**: Ensure the disk is mounted at `/home/node/.n8n`

## Updating n8n

To update to the latest n8n version:
1. Edit `Dockerfile` and change the tag if needed (or leave as `latest`)
2. Push changes to trigger a new deploy
3. Render will rebuild and deploy with the latest image
