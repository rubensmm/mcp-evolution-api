# MCP Evolution API

A Model Context Protocol (MCP) server for Claude that integrates with [Evolution API](https://doc.evolution-api.com/) for WhatsApp automation.

## Overview

This MCP server allows Claude to interact with WhatsApp through the Evolution API, enabling capabilities like:
- Managing WhatsApp instances
- Sending various types of messages
- Working with contacts and groups
- Configuring webhooks and settings

## 📂 Project Structure

```
mcp-evo-api/
├── src/
│   ├── tools/          # MCP tools implementation for Evolution API
│   ├── utils/          # Shared utilities, including Evolution API client
│   ├── main.ts         # Server entry point
│   └── types.ts        # Shared type definitions
├── scripts/            # Helper scripts
├── biome.json          # Linting configuration
├── tsconfig.json       # TypeScript configuration
├── docker-compose.yml  # Docker Compose configuration
├── Dockerfile          # Docker build configuration
└── package.json        # Project dependencies
```

## 🚀 Quick Setup

### Environment Setup

Create a `.env` file with your Evolution API credentials:
```
EVOLUTION_API_URL=https://your-evolution-api-server.com
EVOLUTION_API_KEY=your-api-key-here
```

### 📋 Deployment Options

| Environment | Steps | Command |
|-------------|-------|---------|
| **Local Development** | 1. Clone and install<br>2. Run in dev mode | `git clone https://github.com/aiteks-ltda/mcp-evo-api.git && cd mcp-evo-api && bun install`<br>`bun run dev` |
| **Local Production** | 1. Clone and install<br>2. Build and run | `git clone https://github.com/aiteks-ltda/mcp-evo-api.git && cd mcp-evo-api && bun install`<br>`bun run build && bun run dist/main.js` |
| **Docker Compose** | Run with Docker Compose | `git clone https://github.com/aiteks-ltda/mcp-evo-api.git && cd mcp-evo-api`<br>`docker-compose up -d` |
| **Docker** | Build and run container | `docker run -d -p 3000:3000 -e EVOLUTION_API_URL=yoururl -e EVOLUTION_API_KEY=yourkey --name mcp-evo-api ghcr.io/aiteks-ltda/mcp-evo-api:latest` |

### Claude Desktop Configuration

Add this to your Claude Desktop config file (typically located at `~/Library/Application Support/Claude/claude_desktop_config.json`):

```json
{
  "mcpServers": {
    "evo-api": {
      "command": "node",
      "args": [
        "/path/to/your/mcp-evo-api/dist/main.js"
      ]
    }
  }
}
```

If using the Docker deployment:
```json
{
  "mcpServers": {
    "evo-api": {
      "url": "http://localhost:3000"
    }
  }
}
```

## 📊 Implementation Status

| Category | Implemented | Pending Implementation |
|----------|-------------|------------------------|
| **Core API** | ✅ Get Information<br>✅ Create Instance<br>✅ Fetch Instances<br>✅ Instance Connect<br>✅ Restart Instance<br>✅ Connection State<br>✅ Logout Instance<br>✅ Delete Instance<br>✅ Set Presence | ❌ Check is WhatsApp |
| **Webhook & Settings** | ✅ Set Webhook<br>✅ Find Webhook<br>✅ Set Settings<br>✅ Find Settings | |
| **Messaging** | ✅ Send Plain Text<br>✅ Send Status<br>✅ Send Media<br>✅ Send WhatsApp Audio<br>✅ Send Sticker<br>✅ Send Location<br>✅ Send Contact<br>✅ Send Reaction<br>✅ Send Poll<br>✅ Send List<br>✅ Send Buttons | ❌ Mark Message As Read<br>❌ Mark Message As Unread<br>❌ Archive Chat<br>❌ Delete Message for Everyone<br>❌ Update Message<br>❌ Send Presence (Chat Ctrl) |
| **Chat & Contacts** | ✅ Find Contacts<br>✅ Find Chats | ❌ Update Block Status<br>❌ Fetch Profile Picture URL<br>❌ Get Base64<br>❌ Find Messages<br>❌ Find Status Message |
| **Groups** | ✅ Find Group by JID<br>✅ Fetch All Groups<br>✅ Find Group Members | ❌ Create Group<br>❌ Update Group Picture<br>❌ Update Group Subject<br>❌ Update Group Description<br>❌ Fetch Invite Code<br>❌ Revoke Invite Code<br>❌ Send Group Invite<br>❌ Find Group by Invite Code<br>❌ Update Group Members<br>❌ Update Group Setting<br>❌ Toggle Ephemeral<br>❌ Leave Group |
| **Profile Settings** | | ❌ Fetch Business Profile<br>❌ Fetch Profile<br>❌ Update Profile Name<br>❌ Update Profile Status<br>❌ Update Profile Picture<br>❌ Remove Profile Picture<br>❌ Fetch Privacy Settings<br>❌ Update Privacy Settings |
| **Bot Integrations** | | ❌ Typebot Integrations<br>❌ OpenAI Integrations<br>❌ Evolution Bot<br>❌ Dify Bot<br>❌ Flowise Bot |
| **Other Integrations** | | ❌ Chatwoot<br>❌ Websocket<br>❌ SQS<br>❌ RabbitMQ |

For more information, refer to the [Evolution API Documentation](https://doc.evolution-api.com/).


--- PORTUGUÊS ---

# MCP Evolution API

Um servidor Model Context Protocol (MCP) para Claude que se integra com a [Evolution API](https://doc.evolution-api.com/) para automação no WhatsApp.

## Visão Geral

Este servidor MCP permite que o Claude interaja com o WhatsApp por meio da Evolution API, habilitando funcionalidades como:
- Gerenciamento de instâncias do WhatsApp
- Envio de diversos tipos de mensagens
- Trabalho com contatos e grupos
- Configuração de webhooks e settings

## 📂 Project Structure

```
mcp-evo-api/
├── src/
│   ├── tools/          # MCP tools implementation for Evolution API
│   ├── utils/          # Shared utilities, including Evolution API client
│   ├── main.ts         # Server entry point
│   └── types.ts        # Shared type definitions
├── scripts/            # Helper scripts
├── biome.json          # Linting configuration
├── tsconfig.json       # TypeScript configuration
├── docker-compose.yml  # Docker Compose configuration
├── Dockerfile          # Docker build configuration
└── package.json        # Project dependencies
```

## 🚀 Configuração Rápida

### Configuração do Ambiente

Crie um arquivo `.env` com suas credenciais da Evolution API:
```
EVOLUTION_API_URL=https://your-evolution-api-server.com
EVOLUTION_API_KEY=your-api-key-here
```

### 📋 Opções de Deployment

| Environment | Steps | Command |
|-------------|-------|---------|
| **Local Development** | 1. Clone e instale<br>2. Execute em modo dev | `git clone https://github.com/aiteks-ltda/mcp-evo-api.git && cd mcp-evo-api && bun install`<br>`bun run dev` |
| **Local Production** | 1. Clone e instale<br>2. Build e execute | `git clone https://github.com/aiteks-ltda/mcp-evo-api.git && cd mcp-evo-api && bun install`<br>`bun run build && bun run dist/main.js` |
| **Docker Compose** | Execute com Docker Compose | `git clone https://github.com/aiteks-ltda/mcp-evo-api.git && cd mcp-evo-api`<br>`docker-compose up -d` |
| **Docker** | Build e execute o container | `docker run -d -p 3000:3000 -e EVOLUTION_API_URL=yoururl -e EVOLUTION_API_KEY=yourkey --name mcp-evo-api ghcr.io/aiteks-ltda/mcp-evo-api:latest` |

### Configuração do Claude Desktop

Adicione isso ao seu arquivo de configuração do Claude Desktop (geralmente localizado em `~/Library/Application Support/Claude/claude_desktop_config.json`):

```json
{
  "mcpServers": {
    "evo-api": {
      "command": "node",
      "args": [
        "/path/to/your/mcp-evo-api/dist/main.js"
      ]
    }
  }
}
```

Se estiver usando o deployment com Docker:
```json
{
  "mcpServers": {
    "evo-api": {
      "url": "http://localhost:3000"
    }
  }
}
```

## 📊 Status de Implementação

| Categoria | Implementado | Pendente de Implementação |
|----------|-------------|------------------------|
| **Core API** | ✅ Get Information<br>✅ Create Instance<br>✅ Fetch Instances<br>✅ Instance Connect<br>✅ Restart Instance<br>✅ Connection State<br>✅ Logout Instance<br>✅ Delete Instance<br>✅ Set Presence | ❌ Check is WhatsApp |
| **Webhook & Settings** | ✅ Set Webhook<br>✅ Find Webhook<br>✅ Set Settings<br>✅ Find Settings | |
| **Messaging** | ✅ Send Plain Text<br>✅ Send Status<br>✅ Send Media<br>✅ Send WhatsApp Audio<br>✅ Send Sticker<br>✅ Send Location<br>✅ Send Contact<br>✅ Send Reaction<br>✅ Send Poll<br>✅ Send List<br>✅ Send Buttons | ❌ Mark Message As Read<br>❌ Mark Message As Unread<br>❌ Archive Chat<br>❌ Delete Message for Everyone<br>❌ Update Message<br>❌ Send Presence (Chat Ctrl) |
| **Chat & Contacts** | ✅ Find Contacts<br>✅ Find Chats | ❌ Update Block Status<br>❌ Fetch Profile Picture URL<br>❌ Get Base64<br>❌ Find Messages<br>❌ Find Status Message |
| **Groups** | ✅ Find Group by JID<br>✅ Fetch All Groups<br>✅ Find Group Members | ❌ Create Group<br>❌ Update Group Picture<br>❌ Update Group Subject<br>❌ Update Group Description<br>❌ Fetch Invite Code<br>❌ Revoke Invite Code<br>❌ Send Group Invite<br>❌ Find Group by Invite Code<br>❌ Update Group Members<br>❌ Update Group Setting<br>❌ Toggle Ephemeral<br>❌ Leave Group |
| **Profile Settings** | | ❌ Fetch Business Profile<br>❌ Fetch Profile<br>❌ Update Profile Name<br>❌ Update Profile Status<br>❌ Update Profile Picture<br>❌ Remove Profile Picture<br>❌ Fetch Privacy Settings<br>❌ Update Privacy Settings |
| **Bot Integrations** | | ❌ Typebot Integrations<br>❌ OpenAI Integrations<br>❌ Evolution Bot<br>❌ Dify Bot<br>❌ Flowise Bot |
| **Other Integrations** | | ❌ Chatwoot<br>❌ Websocket<br>❌ SQS<br>❌ RabbitMQ |

Para mais informações, consulte a [Evolution API Documentation](https://doc.evolution-api.com/).
