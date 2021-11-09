# README

[OPTiM AI Camera](https://www.optim.cloud/services/ai-camera/) の API 連携機能を利用し会議室の混雑・利用状況を可視化するサンプル実装 (API サーバーサイド)  
フロントエンドは[こちら](https://github.com/optim-corp/aicamera-api-sample-frontend)

### API 一覧

##### GET api/v1/congestion/meetings/{meeting_id}

- **AICamera から対象カメラの混雑状況を取得**
- 使用 API: [最新混雑情報取得 (AICamera API 連携機能)](https://api.camera-lite.ai.optim.cloud/v1/corporation/{corporation_id}/camera/{camera_api_key}/congestion/latest)
- 実装: [./app/controllers/api/v1/congestion/cameras_controller.rb](app/controllers/api/v1/congestion/cameras_controller.rb)

##### GET api/v1/reserve/meetings/{​​​​​meetings_id}​​​​

- **Microsoft Outlook から対象会議室の予約有無を取得**
- 使用 API: [calendarView 一覧取得 (Microsoft Graph)](https://docs.microsoft.com/ja-jp/graph/api/user-list-calendarview?view=graph-rest-1.0&tabs=http)
- 実装: [./app/controllers/api/v1/reserve/calendars_controller.rb](app/controllers/api/v1/reserve/calendars_controller.rb)

### 設定値

環境変数

下記環境変数を OS へ設定、もしくは [.env.example](./.env.example) を参考に `.env` ファイルを作成してください。

- AICAMERA_CLIENT_ID : `クライアントID (AI Camera Web API)`
- AICAMERA_CLIENT_SECRET_KEY : `シークレットキー (AI Camera Web API)`
- CALENDAR_CLIENT_ID : `クライアントID (Microsoft Graph API)`
- CALENDAR_CLIENT_SECRET_KEY : `シークレットキー (Microsoft Graph API)`

その他

[./config/environments/development.rb](./config/environments/development.rb)に以下を設定してください。

- corporation_id : `対象カメラを保有している企業のID (AICamera情報)`
- camera_api_key : `対象カメラのAPIキー (AICamera情報)`
- meeting_address : `会議室のメールアドレス (Outlook情報)`

### インストール

```sh
$ git clone https://github.com/optim-corp/aicamera-api-sample-backend
$ cd aicamera-api-sample-backend
$ bundle install
```

### 起動

本サンプルは `development`モードでの起動を想定しています。

```sh
$ open http://localhost:3000 # ブラウザで開く
$ rails s
## または
$ bundle exec rails s
```

`production`モードでの起動の場合は credentials を適宜作成してください(参照: [RAILS GUIDES](https://edgeguides.rubyonrails.org/security.html#custom-credentials))。

```sh
# credentialsの生成
$ bundle exec rails credentials:edit -e production
# 起動
$ bundle exec rails s -e production
```

### Ruby バージョン

- Ruby `3.0.2`
- Ruby on Rails `6.1.4.1`

### 関連資料

- [OPTiM AI Camera | カメラを繋いですぐに使える AI 画像解析サービス](https://www.optim.cloud/services/ai-camera/)
- [OPTiM AI Camera Web API v1 (1.0.0)](https://developer-docs.camera-lite.ai.optim.cloud)

### License

[MIT License](./LICENSE)
