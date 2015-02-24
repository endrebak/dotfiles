# evil-snipe contribution layer for Spacemacs

![logo](img/Cat_With_Rifle.jpg)

;; Generate TOC here, use the command `markdown-toc/generate-toc`

## Description
[evil-snipe](https://github.com/hlissner/evil-snipe)
- enables more efficient searches with `f/F/t/T`.
- adds a new, more precise search with `s/S`

### f/F/t/T-upgrades
Instead of repeating searches with `,/;` you can just press `f` again to continue the search (`F` to go the opposite direction).

Evil-snipe also adds several other scope options for searches (set `evil-snipe-scope` and `evil-snipe-repeat-scope` to one of these):
```
'line ;; search line after the cursor (this is vim-seek behavior)
'buffer ;; search rest of the buffer after the cursor (vim-sneak behavior and default in this contrib layer)
'visible ;; search rest of visible buffer (Is more performant than 'buffer, but
         ;; will not highlight/jump past the visible buffer)
'whole-line ;; same as 'line, but highlight matches on either side of cursor
'whole-buffer ;; same as 'buffer, but highlight *all* matches in buffer
'whole-visible ;; same as 'visible, but highlight *all* visible matches in buffer"
```

If you do not want to replace the regular `f/F/t/T` behavior, just remove this line from `evil-snipe/packages.el`: `(evil-snipe-replace-evil)`

### Improved precision search
Now you can press `s/S` to search forward/backwards in the buffer with two chars. This greatly improves the precision of the search and is much more useful than it might sound at first. Try it and I'm sure you'll love it!

## Install

To use this contribution add it to your `~/.spacemacs`

```elisp
(setq-default dotspacemacs-configuration-layers '(evil-snipe))
```

## Key bindings
There are no leader-key activated keybindings for this package.