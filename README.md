# every-minutes-to-google-pubsub

GAE の cron から Google Cloud Pub/Sub に投げるサンプル

## configuration

app.yaml.example の env_variables を編集して app.yaml とする必要あり

- PROJECT_ID: pubsub のプロジェクトID
- TOPIC: pubsub のトピック名
- TZ: 必要ならタイムゾーンを設定

