# ビルド用のステージ
FROM golang:latest AS builder

# 作業ディレクトリを設定
WORKDIR /app

# 依存関係のキャッシュを活用するため、go.mod と go.sum を先にコピー
COPY go.mod go.sum ./
RUN go mod download

# ソースコードをコピー
COPY . .

# アプリケーションをビルド
RUN go build -o main .

# 実行用のステージ（軽量化）
FROM alpine:latest
WORKDIR /app

# 必要なファイルのみコピー
COPY --from=builder /app/main .

# ポートを公開
EXPOSE 8080

# 実行コマンド
CMD ["./main"]
