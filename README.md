初期化

`Docsify.dockerfile`の`ENDPOINT`をコメントアウト

```bash
docker-compose up --build
docker-compose exec app docsify init .
. already exists.
✔ Are you sure you want to rewrite it? (y/N) true
Initialization succeeded! Please run docsify serve .
```

`Docsify.dockerfile`の`ENDPOINT`をコメントアウトを元に戻し、コンテナを再ビルド

```bash
docker-compose down
docker-compose up --build
```

以降は`docker-compose up`だけで良い

`docs/`にdocsifyのファイル群がある

PDFを作る場合

```bash
docker-compose exec app docsify-pdf-converter
```