# TODO
- [x] c-space issue
- [x] tab not working in insert mode - should be ctrl + tab
- [x] backup/restore
- [x] coc.nvim autoinstall script
- [x] java run
- java mvn
- [x] run test
- [x] relative line num
- [x] code fold - key already mapped to font resizer
- prefix then W, Q capitalization issue, delay
- line number - relative, normal, hybrid
- unresolved-import issue with python pipenv, MPLS
- open tab - don't open duplicate untill asked explicitly
- try google/vim-codefmt [x]
- status for vim-signify
- colorize
- try int3/vim-extradite - browse git commits

# Cheatsheet

## Motion
all the below movements can be preceded by a count; e.g. 4j moves down 4 lines
```
 h   move one character left
 j   move one row down
 k   move one row up
 l   move one character right
 w   move to beginning of next word
 b   move to previous beginning of word
 e   move to end of word
 W   move to beginning of next word after a whitespace
 B   move to beginning of previous word before a whitespace
 E   move to end of word before a whitespace
 0   move to beginning of line
 $   move to end of line
 _   move to first non-blank character of the line
 g_  move to last non-blank character of the line
 gg  move to first line
 G   move to last line
 ngg move to n'th line of file (n is a number; 12gg moves to line 12)
 H   move to top of screen
 M   move to middle of screen
 L   move to bottom of screen
 zz  scroll the line with the cursor to the center of the screen
 zt  scroll the line with the cursor to the top
 zb  scroll the line with the cursor to the bottom
 Ctrl-d  move half-page down
 Ctrl-u  move half-page up
 Ctrl-b  page up  TODO: conflict with ctrl+b - go to definition
 Ctrl-f  page down  TODO: conflict with ctrl+f - fzf find string
 Ctrl-o  jump to last (older) cursor position
 Ctrl-i  jump to next cursor position (after Ctrl-O)
 Ctrl-y  move view pane up
 Ctrl-e  move view pane down
 n   next matching search pattern
 N   previous matching search pattern
 *   next whole word under cursor
 #   previous whole word under cursor
 g*  next matching search (not whole word) pattern under cursor
 g#  previous matching search (not whole word) pattern under cursor
 gd  go to definition/first occurrence of the word under cursor
 %   jump to matching bracket { } [ ] ( )
 fX  to next 'X' after cursor, in the same line (X is any character)
 FX  to previous 'X' before cursor (f and F put the cursor on X)
 tX  til next 'X' (similar to above, but cursor is before X)
 TX  til previous 'X'
 ;   repeat above, in same direction
 ,   repeat above, in reverse eadirection
```

## Utils
```
 visual select + U     convert to upper case
 visual select + u     convert to lower case
 
 Without using a visual selection, gU<motion> will make the characters in motion uppercase, or use gu<motion> for lowercase.
 ~    : Changes the case of current character
 guu  : Change current line from upper to lower.
 gUU  : Change current LINE from lower to upper.
 guw  : Change to end of current WORD from upper to lower.
 guaw : Change all of current WORD to lower.
 gUw  : Change to end of current WORD from lower to upper.
 gUaw : Change all of current WORD to upper.
 g~~  : Invert case to entire line
 guG : Change to lowercase until the end of document.
```

## Macro
```
 qd 	start recording to register d
 ... 	your complex series of commands
 q 	stop recording
 @d 	execute your macro
 @@ 	execute your macro again 
 4@d 	execute your macro 4 times 
```
