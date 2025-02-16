FROM postgres:15-alpine

# 環境変数の設定
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=password
ENV POSTGRES_DB=db

# 初期データを用意する場合（オプション）
# COPY init.sql /docker-entrypoint-initdb.d/

# 健全性チェック用のヘルスチェック
HEALTHCHECK --interval=10s --timeout=5s --retries=5 \
  CMD pg_isready -U $POSTGRES_USER -d $POSTGRES_DB || exit 1

