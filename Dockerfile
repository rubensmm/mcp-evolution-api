# Build Stage
FROM oven/bun:latest AS builder

WORKDIR /app

COPY package.json bun.lockb ./
RUN bun install

COPY . .

RUN bun run build

# Production Stage
FROM oven/bun:latest

WORKDIR /app

# Copy built files
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/package.json ./
COPY --from=builder /app/bun.lockb ./

# If needed, copy env or config files
# COPY --from=builder /app/.env ./

# Set default environment variables
ENV EVOLUTION_API_URL=https://sua-url-da-evolution-api.com
ENV EVOLUTION_API_KEY=sua-chave-api-aqui

RUN bun install

# Optional: Copy node_modules if Bun has issues
# COPY --from=builder /app/node_modules ./node_modules
# COPY --from=builder /app/.bun ./.bun

# Mantenha o contêiner em execução
ENTRYPOINT ["tail", "-f", "/dev/null"]
