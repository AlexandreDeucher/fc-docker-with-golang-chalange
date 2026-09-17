FROM alpinelinux/golang AS builder

WORKDIR /src/app

RUN go mod init fc-docker-with-golang-chalange
RUN touch main.go

RUN printf 'package main\n\nimport "fmt"\n\nfunc main() {\n\tfmt.Println("Full Cycle Rocks!!")\n}' > main.go
RUN go build -ldflags="-s -w" -o main .

FROM scratch

WORKDIR /src/app

COPY --from=builder /src/app .

ENTRYPOINT ["./main"]
