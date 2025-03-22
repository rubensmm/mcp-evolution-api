# Build Stage
FROM oven/bun:1.0.29 as builder

WORKDIR /app

COPY package.json bun.lockb ./
RUN bun install --frozen-lockfile

COPY . .

RUN bun run build

# Production Stage
FROM oven/bun:1.0.29-slim

WORKDIR /app

COPY --from=builder /app/dist ./dist
COPY --from=builder /app/package.json ./
COPY --from=builder /app/bun.lockb ./

RUN bun install --production --frozen-lockfile

CMD ["bun", "run", "dist/main.js"]
