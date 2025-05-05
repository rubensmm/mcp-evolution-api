# Etapa de build
FROM oven/bun:latest AS builder

WORKDIR /app

COPY package.json bun.lockb ./
RUN bun install --frozen-lockfile

COPY . .
RUN bun run build

# Etapa de produção
FROM oven/bun:slim

WORKDIR /app

# Copia apenas os arquivos necessários para execução
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/package.json ./package.json
COPY --from=builder /app/bun.lockb ./bun.lockb

# Reinstala só as dependências de produção
RUN bun install --production

# Define variáveis de ambiente padrão (podem ser sobrescritas no docker-compose)
ENV EVOLUTION_API_URL=https://sua-url-da-evolution-api.com
ENV EVOLUTION_API_KEY=sua-chave-api-aqui
ENV NODE_ENV=production
ENV PORT=3000

# Expõe a porta que a aplicação escuta
EXPOSE ${PORT}

# Comando para iniciar a aplicação (ajuste para seu framework)
CMD ["bun", "run", "start"]
