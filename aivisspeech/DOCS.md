# AivisSpeech Engine

## English

### Start the engine

Start the add-on and open its log. The engine is ready when the log reports that application startup is complete. The first start downloads the default AIVMX model and BERT model data. This requires internet access and can take several minutes.

The add-on uses the official AivisSpeech Engine 1.2.0 CPU image. AivisSpeech Engine requires at least 1.5 GB of available RAM. Its first download uses approximately 250 MB for the default voice model and 650 MB for the BERT model cache.

### Add AIVMX models

Use a Home Assistant file-sharing or file-management method to place each `.aivmx` file in:

```text
/share/aivisspeech/Models/
```

Restart the add-on after adding, replacing, or removing files. AivisSpeech Engine scans this directory during startup. Multiple models may be stored in the directory.

The entire engine data directory is stored under `/share/aivisspeech`. It persists across add-on restarts and updates.

### Configure VOICEVOX TTS

Install [VOICEVOX TTS](https://github.com/taikun114/VOICEVOX-TTS-for-Home-Assistant) from HACS, restart Home Assistant if requested, and add the **VOICEVOX TTS** integration.

Enter:

```text
Host: 07f76156-aivisspeech-engine
Port: 10101
```

The host is the internal DNS name generated from this repository and the add-on slug. It works from Home Assistant Core without publishing port 10101 to the host or LAN.

Choose a speaker and style in the integration setup. The initial release targets synthesis with the integration's default volume, pitch, and speed values.

### Test TTS and Assist

To test the TTS entity, open **Developer Tools → Actions**, select `tts.speak`, choose a media player, and enter Japanese text.

To use the entity with Assist, open **Settings → Voice assistants**, edit the target pipeline, and select the created VOICEVOX TTS entity under **Text-to-speech**.

### Troubleshooting

**The add-on remains in its first startup for several minutes**

Check its log for model downloads. Confirm that Home Assistant has internet access, at least 1.5 GB of available RAM, and enough free storage.

**VOICEVOX TTS cannot connect**

Confirm that the add-on is running and that the host and port exactly match `07f76156-aivisspeech-engine` and `10101`. The hostname is available only from Home Assistant's internal network.

**A manually placed model does not appear**

Confirm that the filename ends in `.aivmx` and is inside `/share/aivisspeech/Models`, then restart the add-on. Inspect the add-on log for model validation errors.

**A model disappeared after an update**

Confirm that it was stored under `/share/aivisspeech/Models`. Files stored elsewhere in the container are not persistent.

## 日本語

### Engineの起動

Add-onを起動してログを開きます。アプリケーションの起動完了がログに表示されたら利用できます。初回起動では標準AIVMXモデルとBERTモデルデータをダウンロードします。インターネット接続が必要で、完了まで数分かかる場合があります。

このAdd-onはAivisSpeech Engine 1.2.0の公式CPUイメージを使用します。AivisSpeech Engineには1.5 GB以上の空きメモリが必要です。初回ダウンロードでは、標準音声モデルに約250 MB、BERTモデルキャッシュに約650 MBを使用します。

### AIVMXモデルの追加

Home Assistantのファイル共有またはファイル管理手段を使い、`.aivmx` ファイルを次のディレクトリへ配置します。

```text
/share/aivisspeech/Models/
```

ファイルを追加、差し替え、削除した後はAdd-onを再起動します。AivisSpeech Engineは起動時にこのディレクトリを走査します。複数のモデルを同じディレクトリへ配置できます。

Engineのデータディレクトリ全体は `/share/aivisspeech` に保存されます。Add-onの再起動と更新後も保持されます。

### VOICEVOX TTSの設定

HACSから[VOICEVOX TTS](https://github.com/taikun114/VOICEVOX-TTS-for-Home-Assistant)をインストールします。必要に応じてHome Assistantを再起動し、**VOICEVOX TTS** Integrationを追加します。

接続先には次の値を入力します。

```text
ホスト: 07f76156-aivisspeech-engine
ポート: 10101
```

このホストはリポジトリとAdd-onのslugから生成される内部DNS名です。ポート10101をホストやLANへ公開せずにHome Assistant Coreから接続できます。

Integrationの設定でSpeakerとStyleを選びます。初期版では、Integrationの音量、ピッチ、話速を標準値にした音声合成を対象とします。

### TTSとAssistの確認

TTS Entityを確認するには、**開発者ツール → アクション** で `tts.speak` を選び、Media Playerと日本語の文章を指定して実行します。

Assistで使うには、**設定 → 音声アシスタント** から対象のPipelineを編集し、**テキスト読み上げ** に作成したVOICEVOX TTS Entityを指定します。

### トラブルシューティング

**初回起動が数分経っても終わらない**

Add-onのログでモデルのダウンロード状況を確認します。Home Assistantがインターネットへ接続できること、1.5 GB以上の空きメモリがあること、ストレージに空きがあることを確認してください。

**VOICEVOX TTSから接続できない**

Add-onが起動していることを確認し、ホストが `07f76156-aivisspeech-engine`、ポートが `10101` になっているか確認します。このホスト名はHome Assistantの内部ネットワークからだけ利用できます。

**配置したモデルが表示されない**

拡張子が `.aivmx` であり、ファイルが `/share/aivisspeech/Models` にあることを確認してからAdd-onを再起動します。モデルの検証エラーはAdd-onのログで確認できます。

**更新後にモデルが見つからない**

モデルが `/share/aivisspeech/Models` に保存されていたか確認します。コンテナ内のほかの場所に置いたファイルは永続化されません。

