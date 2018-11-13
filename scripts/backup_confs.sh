#!/bin/bash

. ~/paths.sh
HOSTNAME=$(hostname)
echo "[$(date +"%Y-%m-%d-%I:%M:%S")] " 'Configs backup started.'


mkdir -p $TARGET_DIR

# backups following items
cp "$SOURCE_DIR/paths.sh" "$TARGET_DIR/"
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
cp -r "$SOURCE_DIR/.personalized" "$TARGET_DIR/"

substr="cinnamon"

if [ "$DESKTOP_SESSION" = $substr ]; then
	echo "[$(date +"%Y-%m-%d-%I:%M:%S")] " Found $DESKTOP_SESSION desktop environment, backing up configs...
	dconf dump /org/cinnamon/ > "$TARGET_DIR/cinnamon_backup"
fi	

echo "[$(date +"%Y-%m-%d-%I:%M:%S")] " 'Files backed up at' $TARGET_DIR'.'
