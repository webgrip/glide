FROM node:24.19.0-bookworm-slim AS base
RUN apt-get update && apt-get install -y --no-install-recommends git ca-certificates && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY --chown=node:node package.json ./
COPY --chown=node:node src ./src
COPY --chown=node:node public ./public
COPY --chown=node:node examples ./examples
COPY --chown=node:node scripts ./scripts
RUN mkdir -p /data && chown node:node /data
ENV VLOER_HOST=0.0.0.0 VLOER_PORT=4080 VLOER_DATA_DIR=/data
EXPOSE 4080

FROM base AS live
USER root
RUN npm install --global opencode-ai@1.18.30 && npm cache clean --force
USER node
CMD ["node", "src/main.ts"]

FROM base AS app
USER node
CMD ["node", "src/main.ts"]
