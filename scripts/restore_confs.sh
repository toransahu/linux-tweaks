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
cp "$SOURCE_DIR/.bashrc.save" "$TMP_BAK_DIR/"
cp "$SOURCE_DIR/.editorconfig" "$TMP_BAK_DIR/"
cp "$SOURCE_DIR/.tmux.conf" "$TMP_BAK_DIR/"
cp "$SOURCE_DIR/.vimrc" "$TMP_BAK_DIR/"
cp "$SOURCE_DIR/.zshrc" "$TMP_BAK_DIR/"
cp "$SOURCE_DIR/.commonrc" "$TMP_BAK_DIR/"

string="$(hostname)"
substr="mint"
if [ -z "${string##*$substr*}" ]; then
	dconf dump /org/cinnamon/ > "$TMP_BAK_DIR/cinnamon_backup_$HOSTNAME"
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
cp "$TARGET_DIR/.bashrc.save" "$SOURCE_DIR/"
cp "$TARGET_DIR/.editorconfig" "$SOURCE_DIR/"
cp "$TARGET_DIR/.tmux.conf" "$SOURCE_DIR/"
cp "$TARGET_DIR/.vimrc" "$SOURCE_DIR/"
cp "$TARGET_DIR/.zshrc" "$SOURCE_DIR/"
cp "$TARGET_DIR/.commonrc" "$SOURCE_DIR/"
cp "$TARGET_DIR/.gitrepo" "$SOURCE_DIR/"


echo "[$(date +"%Y-%m-%d-%I:%M:%S")] " 'Configs Restore Completed.'
