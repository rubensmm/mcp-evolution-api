# Build stage
FROM oven/bun:1.0.29 as builder

WORKDIR /app

# Copy package files
COPY package.json bun.lockb ./

# Install dependencies
RUN bun install --frozen-lockfile

# Copy source files
COPY . .

# Build application
RUN bun run build

# Production stage
FROM oven/bun:1.0.29-slim

WORKDIR /app

# Copy only necessary files
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/package.json ./

# Install only production deps (optional but best practice)
RUN bun install --production --frozen-lockfile

# No need to expose port - Smithery expects stdio communication, not HTTP

CMD ["bun", "run", "dist/main.js"]
