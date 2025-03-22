FROM oven/bun:1.0.29 as builder

WORKDIR /app

# Copy package files
COPY package.json package-lock.json bun.lockb ./

# Install dependencies
RUN bun install --frozen-lockfile

# Copy the rest of the application
COPY . .

# Build the application
RUN bun run build

# Create production image
FROM oven/bun:1.0.29-slim

WORKDIR /app

# Copy only the necessary files from the builder stage
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/package.json ./

# Set environment variables
ENV NODE_ENV=production

# Run the application with the correct command
CMD ["bun", "run", "dist/main.js"]

# Document that the service listens on port 3000
EXPOSE 3000 