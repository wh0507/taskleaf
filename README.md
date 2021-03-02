# アプリ名
  TASK-M

# 概要
  - 新規登録機能
  - タスク登録機能
  - マイページ（カレンダー表示）

# 本番環境
  http://54.178.27.80/
  
  ID/Pass
  - ID: taskm	
  - Pass: p1324
  
  ログイン情報（テスト用）
  - Eメール：test1@test1.com
  - パスワード：13241324

# 制作背景（意図）
  - 自分の日常を含めて、生活のスケジュール管理のため

# DEMO
  - 新規登録画面
  - トップページ
   ![トップページ](https://gyazo.com/dc33cafe16f88b84312bd3e6c1233034)
  - タスク登録画面
  - 詳細表示画面
  - 編集・削除画面

# 工夫したポイント

# 使用記述(開発環境)
  ## パックエンド
    Ruby, Ruby on Rails
  ## フロントエンド
    Slim, Sass, JavaScript, JQuery, Ajax
  ## データベース
    MySQL, SequelPro
  ## インフラ
    AWS(EC2), Capistrano
  ## Webサーバー（本番環境）
    nginx
  ## アプリケーションサーバー（本番環境）
    unicorn
  ## ソース管理
    GitHub, GitHubDesktop
  ## エディタ
    VSCode

# 課題や今後実装したい機能


# DB設計

## User テーブル

| Column              | Type       | Options           |
| ------------------- | ---------- | ----------------- |
| nickname            | string     | null: false       |
| email               | string     | unique: true      |
| encrypted_password  | string     | unique: true      |

### Association

- has_many :tasks

## Task テーブル

| Column          | Type       | Options           |
| --------------  | ---------- | ----------------- |
| title           | string     | null: false       |
| description     | text       |                   |
| start_date      | datetime   | null: false       |
| end_date        | datetime   | null: false       |
| user            | references | foreign_key: true |

### Association

- belongs_to :user