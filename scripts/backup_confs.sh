#!/bin/bash


SOURCE_DIR="/home/toran"
BAK_DIR="$(date +"%Y-%m-%d-%I:%M:%S")"
TARGET_DIR="/mnt/ExternalHDD/E/workspace/linux-tweaks/configs/mint/$BAK_DIR"

echo "[$(date +"%Y-%m-%d-%I:%M:%S")] " 'Configs backup started.'


mkdir -p $TARGET_DIR

# backups following items
cp "$SOURCE_DIR/.bashrc" "$TARGET_DIR/"
cp "$SOURCE_DIR/.bash_aliases" "$TARGET_DIR/"
cp "$SOURCE_DIR/.bashitrc" "$TARGET_DIR/"
cp "$SOURCE_DIR/.bash_profile" "$TARGET_DIR/"
cp "$SOURCE_DIR/.bashrc.save" "$TARGET_DIR/"
cp "$SOURCE_DIR/.editorconfig" "$TARGET_DIR/"
cp "$SOURCE_DIR/.tmux.conf" "$TARGET_DIR/"
cp "$SOURCE_DIR/.vimrc" "$TARGET_DIR/"
cp "$SOURCE_DIR/.zshrc" "$TARGET_DIR/"
cp "$SOURCE_DIR/.commonrc" "$TARGET_DIR/"

                                                                                                                                                                     
echo "[$(date +"%Y-%m-%d-%I:%M:%S")] " 'Files backed up at' $TARGET_DIR'.'
