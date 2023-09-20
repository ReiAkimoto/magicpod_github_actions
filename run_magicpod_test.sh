#!/bin/bash -e
# (-eで、コマンドがエラーになった行で処理を終了させる)

# magicpod-apiクライアントの最新版を現在のディレクトリにダウンロード・解凍
# セキュリティのため、MAGICPOD_API_TOKENはGitHubの環境変数で設定
# Windowsマシン上でのビルドの場合はwindows、Linuxはlinuxを指定
OS=mac
# 任意のファイル名
FILENAME=magicpod-api-client
curl -L "https://app.magicpod.com/api/v1.0/magicpod-clients/api/${OS}/latest/" -H "Authorization: Token ${MAGICPOD_API_TOKEN}" --output ${FILENAME}.zip
unzip -q ${FILENAME}.zip

# MagicPodで使う各種環境変数を設定
export MAGICPOD_ORGANIZATION=MagicPod10
export MAGICPOD_PROJECT=DemoBrowser

# 設定番号の設定を使ってテスト一括実行
TEST_SETTING_NUMBER=8
./magicpod-api-client batch-run -S ${TEST_SETTING_NUMBER}
