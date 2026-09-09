FROM node:24.19.0-bookworm-slim
RUN apt-get update && apt-get install -y --no-install-recommends git ca-certificates && rm -rf /var/lib/apt/lists/*
RUN npm install --global opencode-ai@1.18.30 && npm cache clean --force
RUN mkdir -p /workspace /etc/opencode && chown node:node /workspace /etc/opencode
USER node
WORKDIR /workspace
EXPOSE 4096
CMD ["opencode", "serve", "--hostname", "0.0.0.0", "--port", "4096"]
