#! /bin/sh
#
# restore_confs.sh
# Copyright (C) 2018 Toran Sahu <toran.sahu@yahoo.com>
#
# Distributed under terms of the MIT license.
#



. ~/paths.sh
HOSTNAME=$(hostname)


##
# Temporary backup
##
echo "[$(date +"%Y-%m-%d-%I:%M:%S")] " 'Configs temporary backup started.'
TMP_BAK_DIR=~/tmp_bak 
mkdir -p $TMP_BAK_DIR

# backups following items temporarily
cp "$SOURCE_DIR/paths.sh" "$TMP_BAK_DIR/"
cp "$SOURCE_DIR/.bashrc" "$TMP_BAK_DIR/"
cp "$SOURCE_DIR/.bash_aliases" "$TMP_BAK_DIR/"
cp "$SOURCE_DIR/.bashitrc" "$TMP_BAK_DIR/"
cp "$SOURCE_DIR/.bash_profile" "$TMP_BAK_DIR/"
cp "$SOURCE_DIR/.profile" "$TMP_BAK_DIR/"
cp "$SOURCE_DIR/.bashrc.save" "$TMP_BAK_DIR/"
cp "$SOURCE_DIR/.editorconfig" "$TMP_BAK_DIR/"
cp "$SOURCE_DIR/.tmux.conf" "$TMP_BAK_DIR/"
cp "$SOURCE_DIR/.vimrc" "$TMP_BAK_DIR/"
cp "$SOURCE_DIR/.vim/coc-settings.json" "$TMP_BAK_DIR/"
cp "$SOURCE_DIR/.zshrc" "$TMP_BAK_DIR/"
cp "$SOURCE_DIR/.commonrc" "$TMP_BAK_DIR/"
cp -r "$SOURCE_DIR/.personalized" "$TMP_BAK_DIR/"
dconf dump /org/gnome/terminal/legacy/profiles:/ > "$TMP_BAK_DIR/gnome-terminal-profiles.dconf" # terminal profile backup

substr="cinnamon"

if [ "$DESKTOP_SESSION" = $substr ]; then
	dconf dump /org/cinnamon/ > "$TMP_BAK_DIR/cinnamon/cinnamon_backup_$HOSTNAME"
    cp -r "$SOURCE_DIR/.cinnamon/configs" "$TMP_BAK_DIR/cinnamon/"
fi	

echo "[$(date +"%Y-%m-%d-%I:%M:%S")] " 'Files temporarily backed up at' $TMP_BAK_DIR'.'

##
# Restore
##
echo "[$(date +"%Y-%m-%d-%I:%M:%S")] " 'Starting Configs Restore from' $TARGET_DIR'.'

cp "$TARGET_DIR/paths.sh" "$SOURCE_DIR/"
cp "$TARGET_DIR/.bashrc" "$SOURCE_DIR/"
cp "$TARGET_DIR/.bash_aliases" "$SOURCE_DIR/"
cp "$TARGET_DIR/.bashitrc" "$SOURCE_DIR/"
cp "$TARGET_DIR/.bash_profile" "$SOURCE_DIR/"
cp "$TARGET_DIR/.profile" "$SOURCE_DIR/"
cp "$TARGET_DIR/.bashrc.save" "$SOURCE_DIR/"
cp "$TARGET_DIR/.editorconfig" "$SOURCE_DIR/"
cp "$TARGET_DIR/.tmux.conf" "$SOURCE_DIR/"
cp "$TARGET_DIR/.vimrc" "$SOURCE_DIR/"
cp "$TARGET_DIR/coc-settings.json" "$SOURCE_DIR/.vim/"
cp "$TARGET_DIR/.zshrc" "$SOURCE_DIR/"
cp "$TARGET_DIR/.commonrc" "$SOURCE_DIR/"
cp -r "$TARGET_DIR/.personalized" "$SOURCE_DIR/"
dconf load /org/gnome/terminal/legacy/profiles:/ < "$TARGET_DIR/gnome-terminal-profiles.dconf"

substr="cinnamon"

if [ "$DESKTOP_SESSION" = $substr ]; then
	echo "[$(date +"%Y-%m-%d-%I:%M:%S")] " Found $DESKTOP_SESSION desktop environment, restoring configs...
	dconf load /org/cinnamon/ < "$TARGET_DIR/cinnamon/cinnamon_backup"
    cp -r "$TARGET_DIR/cinnamon/configs" "$SOURCE_DIR/.cinnamon/"
fi

echo "[$(date +"%Y-%m-%d-%I:%M:%S")] " 'Configs Restore Completed.'
