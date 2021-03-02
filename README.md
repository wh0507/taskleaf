# アプリ名
  TASK-M

# 概要
  - 新規登録機能
  - タスク登録機能
  - マイページ（カレンダー表示）

# 本番環境
  http://54.178.27.80/
  
  ## ID/Pass
  - ID: taskm	
  - Pass: p1324
  
  ## ログイン情報（テスト用）
  - Eメール：test1@test1.com
  - パスワード：13241324

# 制作背景（意図）
  - 自分の日常を含めて、生活のスケジュール管理のため

# DEMO
  - ### 新規登録(ユーザー登録)画面
  ![ ](https://gyazo.com/3fdd134415c61e997740bd98c75deb8c/raw)
  - ### トップページ
  ![ ](https://gyazo.com/387014a3fa449223ced7fa7bcd8e7b33/raw)
  - ### タスク登録画面
  ![ ](https://gyazo.com/0dbb48a016ec6ed634b8a4ead4de4066/raw)
  - ### 詳細表示画面
  ![ ](https://gyazo.com/575c4f7483e6f76005c9d58a572d52e3/raw)
  - ### 編集・削除画面
  [編集](https://gyazo.com/09972ee4a1e688ff80c43743094afe85/raw),[削除](https://gyazo.com/3e2c1f0141a0f21d791453729ab050cd/raw)

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
  - マイページ実装（ID・パスワード変更など）
  - 登録したタスクをGoogleカレンダーと連携

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