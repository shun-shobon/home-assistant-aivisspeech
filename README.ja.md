# Home Assistant用 AivisSpeech Engine Add-on

[English](README.md) | **日本語**

このリポジトリは、[AivisSpeech Engine](https://github.com/Aivis-Project/AivisSpeech-Engine) を Home Assistant Add-on として実行できるようにします。CPU版EngineをHome Assistant OSまたはHome Assistant Supervised内で動かし、VOICEVOX互換APIをHome Assistantの内部ネットワークへ提供します。

## インストール

[![Home Assistantでこのリポジトリを追加する](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Fshun-shobon%2Fhome-assistant-aivisspeech)

1. Home Assistantで **設定 → アドオン → アドオンストア** を開きます。
2. ストアのメニューから **リポジトリ** を開き、次のURLを追加します。

   ```text
   https://github.com/shun-shobon/home-assistant-aivisspeech
   ```

3. **AivisSpeech Engine** をインストールします。
4. Add-onを起動し、ログにアプリケーションの起動完了が表示されるまで待ちます。初回起動では標準音声モデルとBERTモデルデータをダウンロードするため、数分かかる場合があります。

## モデルの追加

`.aivmx` ファイルを次のディレクトリへ配置します。

```text
/share/aivisspeech/Models/
```

モデルを追加、差し替え、削除した後はAdd-onを再起動してください。モデルとEngineがダウンロードしたデータは `/share/aivisspeech` に保存され、Add-onの再起動と更新後も残ります。

## Home Assistantとの接続

1. HACSから[VOICEVOX TTS](https://github.com/taikun114/VOICEVOX-TTS-for-Home-Assistant)をインストールします。
2. **VOICEVOX TTS** Integrationを追加します。
3. 接続先に次の値を入力します。

   - ホスト：`07f76156-aivisspeech-engine`
   - ポート：`10101`

4. AivisSpeechのSpeakerとStyleを選択します。
5. Assistで使う場合は、**設定 → 音声アシスタント** からPipelineを編集し、**テキスト読み上げ** に作成したVOICEVOX TTS Entityを指定します。

EngineのポートはHome Assistant内部のAdd-onネットワークにだけ公開されます。ホストやLANには公開されません。

## 動作要件

- 現行のAdd-onを利用できるHome Assistant OSまたはHome Assistant Supervised
- `amd64` または `aarch64`
- AivisSpeech Engineが利用できる1.5 GB以上の空きメモリ
- 初回起動時のインターネット接続
- ユーザーが追加するモデルとは別に、標準モデル用約250 MBとBERTモデルキャッシュ用約650 MBの保存領域

起動確認、TTSの利用方法、トラブルシューティングは[Add-onドキュメント](aivisspeech/DOCS.md#日本語)を参照してください。

## ライセンス

このリポジトリ内のファイルは[MIT License](LICENSE)で公開します。AivisSpeech Engineと同梱される依存関係には、それぞれのライセンスが適用されます。
