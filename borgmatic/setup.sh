#!/usr/bin/env bash

set -euo pipefail

echo "Setting up environment variables"

CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"

TARGET_DIR="$CONFIG_DIR/borgmatic.d"
mkdir -p "$TARGET_DIR"

ENV_FILE="$TARGET_DIR/.env"

if [ -z "${BORG_PASSPHRASE:-}" ]; then
    if [ -f "$ENV_FILE" ]; then
        echo "Using existing BORG_PASSPHRASE from $ENV_FILE"
    else
        read -rsp "Enter your Borg passphrase: " BORG_PASSPHRASE
        echo
    fi
fi

if [ -n "${BORG_PASSPHRASE:-}" ]; then
    echo "BORG_PASSPHRASE=${BORG_PASSPHRASE}" > "$ENV_FILE"
    chmod 600 "$ENV_FILE"
fi

echo "Finished setting up environment variables"

echo "Linking borgmatic configuration files"

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"

find "$TARGET_DIR" -type l -delete

if [ -d "$SCRIPT_DIR/shared" ]; then
    ln -sf "$SCRIPT_DIR/shared" "$TARGET_DIR/shared"
    echo "Linked shared folder"
fi

if [ -z "${HOST:-}" ]; then
    read -rp "Enter hostname: " HOST
fi

for file in "$SCRIPT_DIR/${HOST}"*.yaml; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        ln -sf "$file" "$TARGET_DIR/$filename"
        echo "Linked $filename"
    fi
done

echo "Finished linking Borgmatic configuration files"

# SYSTEMD_OVERRIDE_DIR="$CONFIG_DIR/systemd/user/borgmatic-user.service.d"
# mkdir -p "$SYSTEMD_OVERRIDE_DIR"

# cat << EOF > "$SYSTEMD_OVERRIDE_DIR/override.conf"
# [Service]
# EnvironmentFile=$ENV_FILE
# EOF

echo "Linking systemd files"

SYSTEMD_DIR="$CONFIG_DIR/systemd/user"
mkdir -p "$SYSTEMD_DIR"

for file in "$SCRIPT_DIR/systemd"/*; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        ln -sf "$file" "$SYSTEMD_DIR/$filename"
        echo "Linked $filename"
    fi
done

echo "Finished linking systemd files"

echo "Restarting/starting systemd"

systemctl --user daemon-reload
systemctl --user enable --now borgmatic-user.timer

echo "Finished restarting/starting systemd"
