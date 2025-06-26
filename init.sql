-- テーブル定義
CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL
);

CREATE TABLE channels (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE messages (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  channel_id INT NOT NULL,
  content TEXT NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (channel_id) REFERENCES channels(id)
);

-- サンプルデータ挿入
INSERT INTO users (username, email) VALUES
  ('山田太郎', 'yamada@example.com'),
  ('佐藤花子', 'sato@example.com'),
  ('鈴木一郎', 'suzuki@example.com'),
  ('田中美咲', 'tanaka@example.com');

INSERT INTO channels (name) VALUES
  ('general'),
  ('random'),
  ('tech');

INSERT INTO messages (user_id, channel_id, content) VALUES
  (1, 1, 'こんにちは！'),
  (2, 1, 'おはよう。'),
  (3, 2, '雑談しましょう'),
  (4, 3, '最新の技術について話しましょう。'),
  (1, 3, 'Pythonが好きです。'),
  (2, 2, '今日はいい天気ですね。');
