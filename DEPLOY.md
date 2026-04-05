# Deploy n8n to Render

## Option 1: One-Click Deploy (Easiest)

Click this button to deploy directly to Render:

[![Deploy to Render](https://render.com/images/deploy-to-render-button.svg)](https://render.com/deploy?repo=https://github.com/mohammedaliansari14-svg/n8n-render)

**Steps:**
1. Click the button above
2. Sign in to Render (if not already)
3. Give your service a name (e.g., `n8n`)
4. Set these environment variables:
   - `N8N_BASIC_AUTH_USER`: Your login username (e.g., `admin`)
   - `N8N_BASIC_AUTH_PASSWORD`: Your secure password
   - Update `WEBHOOK_URL` to match your service name
5. Click "Deploy"

## Option 2: Manual Deploy via Dashboard

1. Go to [dashboard.render.com](https://dashboard.render.com)
2. Click **"New +"** → **"Blueprint"**
3. Connect your GitHub account and select the `n8n-render` repo
4. Click "Deploy"

## After Deploy

- Access n8n at: `https://your-service-name.onrender.com`
- Login with your `N8N_BASIC_AUTH_USER` and `N8N_BASIC_AUTH_PASSWORD`

## Your Repository

Code is at: https://github.com/mohammedaliansari14-svg/n8n-render
