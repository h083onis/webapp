FROM postgres:15-alpine

# 環境変数の設定（パスワードは docker-compose.yml で管理）
ENV POSTGRES_USER=postgres
ENV POSTGRES_DB=db

# 初期データを設定（開発/本番で異なるファイルを docker-compose.yml で指定）
# COPY init.sql /docker-entrypoint-initdb.d/

# 健全性チェック（環境変数を exec 形式で展開）
HEALTHCHECK --interval=10s --timeout=5s --retries=5 \
  CMD pg_isready -U postgres -d db || exit 1
