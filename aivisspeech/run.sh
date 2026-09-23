#!/usr/bin/env bash
set -euo pipefail

readonly data_dir="/share/aivisspeech"
readonly models_dir="${data_dir}/Models"

if [[ ! -d /share ]]; then
    echo "The Home Assistant share directory is not mounted at /share." >&2
    exit 1
fi

install -d -o user -g user -m 0755 "${data_dir}" "${models_dir}"
chown -R user:user "${data_dir}"

exec gosu user .venv/bin/python ./run.py --host 0.0.0.0 --port 10101

