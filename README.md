# every-minutes-to-google-pubsub

GAE の cron から Google Cloud Pub/Sub に投げるサンプル

## configuration

app.yaml.example の env_variables を編集して app.yaml とする必要あり

- PROJECT_ID: pubsub のプロジェクトID
- TOPIC: pubsub のトピック名
- TZ: 必要ならタイムゾーンを設定
- GOOGLE_KEYFILE: 開発環境等の非GCP環境で指定する、サービスアカウントの鍵ファイル

## deploy

```sh
gcloud --project GAE-PROJECT-ID app deploy
gcloud --project GAE-PROJECT-ID app deploy cron.yaml
```

## subscriber

do examples/subscriber.rb
