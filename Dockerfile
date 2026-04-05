FROM n8nio/n8n:latest

USER root

# Create the .n8n directory and set permissions
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node/.n8n

USER node

ENV N8N_PORT=10000
ENV N8N_PROTOCOL=https
ENV NODE_ENV=production
ENV WEBHOOK_TUNNEL_URL=${WEBHOOK_URL}

EXPOSE 10000

CMD ["n8n", "start"]
