# AivisSpeech Engine Add-on for Home Assistant

**English** | [日本語](README.ja.md)

This repository packages [AivisSpeech Engine](https://github.com/Aivis-Project/AivisSpeech-Engine) as a Home Assistant add-on. It runs the CPU engine inside Home Assistant OS or Home Assistant Supervised and exposes its VOICEVOX-compatible API to Home Assistant's internal network.

## Install

[![Open your Home Assistant instance and add this repository.](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Fshun-shobon%2Fhome-assistant-aivisspeech)

1. Open **Settings → Add-ons → Add-on Store** in Home Assistant.
2. Open the store menu, select **Repositories**, and add:

   ```text
   https://github.com/shun-shobon/home-assistant-aivisspeech
   ```

3. Install **AivisSpeech Engine**.
4. Start the add-on and wait until the log reports that the application startup is complete. The first start downloads the default voice model and BERT model data and can take several minutes.

## Add a model

Place `.aivmx` files in:

```text
/share/aivisspeech/Models/
```

Restart the add-on after adding, replacing, or removing a model. Model files and downloaded engine data remain in `/share/aivisspeech` across add-on restarts and updates.

## Connect Home Assistant

1. Install [VOICEVOX TTS](https://github.com/taikun114/VOICEVOX-TTS-for-Home-Assistant) through HACS.
2. Add the **VOICEVOX TTS** integration.
3. Enter these connection values:

   - Host: `07f76156-aivisspeech-engine`
   - Port: `10101`

4. Select an AivisSpeech speaker and style.
5. To use it with Assist, open **Settings → Voice assistants**, edit the pipeline, and select the created VOICEVOX TTS entity under **Text-to-speech**.

The engine port is available only on Home Assistant's internal add-on network. It is not published to the host or LAN.

## Requirements

- Home Assistant OS or Home Assistant Supervised with current add-on support
- `amd64` or `aarch64`
- At least 1.5 GB of available RAM for AivisSpeech Engine
- Internet access on the first start
- Approximately 250 MB for the default model and 650 MB for the BERT model cache, in addition to user-provided models

See [the add-on documentation](aivisspeech/DOCS.md) for startup checks, TTS use, and troubleshooting.

## License

The files in this repository are released under the [MIT License](LICENSE). AivisSpeech Engine and the included dependencies retain their own licenses.
