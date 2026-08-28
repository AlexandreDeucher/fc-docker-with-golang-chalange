# FC Docker with Golang Challenge

Desafio da Full Cycle: criar e publicar uma imagem Docker mínima (menos de 2MB) que execute uma aplicação em Go, exibindo a mensagem `Full Cycle Rocks!!` no terminal.

## 🚀 Tecnologias

- **Linguagem:** Go
- **Containerização:** Docker (multi-stage build)
- **Registry:** Docker Hub

## 📦 Imagem no Docker Hub

🔗 [alle01/golang](https://hub.docker.com/r/alle01/golang)

## ▶️ Como executar

```bash
docker run alle01/golang:latest
```

### Saída esperada

```
Full Cycle Rocks!!
```

## 🏗️ Como funciona

O `Dockerfile` utiliza multi-stage build:

1. **Stage `builder`** — usa a imagem `golang:latest` para compilar o binário Go.
2. **Stage final** — usa `scratch` (imagem vazia, sem sistema operacional), copiando apenas o binário compilado do stage anterior.

Essa abordagem elimina qualquer overhead de SO na imagem final, resultando em um artefato de poucos megabytes — apenas o binário necessário para rodar a aplicação.

## 📁 Estrutura do projeto

```
├── Dockerfile
├── main.go
├── go.mod
└── README.md
```

## 🔨 Build local (opcional)

```bash
docker build -t alle01/golang:latest .
docker run alle01/golang:latest
```