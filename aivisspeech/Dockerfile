FROM ghcr.io/aivis-project/aivisspeech-engine:cpu-1.2.0

COPY run.sh /usr/local/bin/run-aivisspeech
RUN chmod 0755 /usr/local/bin/run-aivisspeech \
    && mkdir -p /home/user/.local/share \
    && ln -s /share/aivisspeech /home/user/.local/share/AivisSpeech-Engine-Dev

LABEL \
    org.opencontainers.image.title="Home Assistant Add-on: AivisSpeech Engine" \
    org.opencontainers.image.description="AivisSpeech Engine for Home Assistant TTS" \
    org.opencontainers.image.source="https://github.com/shun-shobon/home-assistant-aivisspeech" \
    org.opencontainers.image.licenses="MIT"

HEALTHCHECK --interval=30s --timeout=10s --start-period=15m --retries=3 \
    CMD curl --fail --silent --show-error http://127.0.0.1:10101/version > /dev/null || exit 1

CMD ["/usr/local/bin/run-aivisspeech"]
