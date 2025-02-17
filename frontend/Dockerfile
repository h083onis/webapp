# ✅ 1. ビルド用のステージ
FROM node:22-alpine AS builder

# 作業ディレクトリを設定
WORKDIR /app

# 依存関係のキャッシュを活用
COPY package.json package-lock.json ./
RUN npm install --frozen-lockfile

# ソースコードをコピー
COPY . .

# Next.js アプリケーションをビルド
RUN npm run build

# ✅ 2. 実行用の軽量ステージ
FROM node:22-alpine

# 作業ディレクトリを設定
WORKDIR /app

# `builder` ステージから `node_modules` と `.next` をコピー
COPY --from=builder /app/package.json /app/package-lock.json ./
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/public ./public

# ポートを公開
EXPOSE 3000

# アプリケーションを起動（本番モード）
CMD ["npm", "run", "start"]
