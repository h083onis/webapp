CREATE TABLE IF NOT EXISTS posts (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    slug VARCHAR(255) UNIQUE NOT NULL,
    content TEXT NOT NULL,  -- Markdown 形式で保存
    tags TEXT[],  -- タグを配列で保存
    created_at TIMESTAMP DEFAULT NOW()
);

-- 初期データ（Markdown 記事の例）
INSERT INTO posts (title, slug, content, tags) VALUES
    ('初めてのブログ', 'first-post', '# はじめに\nこれはテスト記事です。', ARRAY['test', 'markdown']),
    ('Docker の使い方', 'docker-tutorial', '# Docker の基本\nDocker の使い方を学ぶ。', ARRAY['docker', 'devops']);
