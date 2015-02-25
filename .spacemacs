;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

;; Configuration Layers
;; --------------------

(setq-default
 ;; List of additional paths where to look for configuration layers.
 ;; Paths must have a trailing slash (ie. `~/.mycontribs/')
 dotspacemacs-configuration-layer-path '("~/spacemacs_contribs/")
 ;; List of configuration layers to load.
 dotspacemacs-configuration-layers '(ruby ess smex clojure python pcre2el company-mode themes-megapack evil-snipe markdown fasd dash) ;;haskell endrebak
 ;; A list of packages and/or extensions that will not be install and loaded.
 dotspacemacs-excluded-packages '(paredit)
)

;; Settings
;; --------

(setq-default
 ;; Specify the startup banner. If the value is an integer then the
 ;; banner with the corresponding index is used, if the value is `random'
 ;; then the banner is chosen randomly among the available banners, if
 ;; the value is nil then no banner is displayed.
 dotspacemacs-startup-banner 'random
 ;; Default theme applied at startup
 dotspacemacs-default-theme 'monokai
 dotspacemacs-themes '(monokai leuven zenburn)
 ;; The leader key
 dotspacemacs-leader-key "SPC"
 ;; Major mode leader key is a shortcut key which is the equivalent of
 ;; pressing `<leader> m`
 dotspacemacs-major-mode-leader-key ","
 ;; The command key used for Evil commands (ex-commands) and
 ;; Emacs commands (M-x).
 ;; By default the command key is `:' so ex-commands are executed like in Vim
 ;; with `:' and Emacs commands are executed with `<leader> :'.
 dotspacemacs-command-key ":"
 ;; Guide-key delay in seconds. The Guide-key is the popup buffer listing
 ;; the commands bound to the current keystrokes.
 dotspacemacs-guide-key-delay 0.4
 ;; If non nil the frame is fullscreen when Emacs starts up (Emacs 24.4+ only).
 dotspacemacs-fullscreen-at-startup t
 ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
 ;; Use to disable fullscreen animations in OSX."
 dotspacemacs-fullscreen-use-non-native t
 ;; If non nil the frame is maximized when Emacs starts up (Emacs 24.4+ only).
 ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
 dotspacemacs-maximized-at-startup t
 ;; A value from the range (0..100), in increasing opacity, which describes the
 ;; transparency level of a frame when it's active or selected. Transparency can
 ;; be toggled through `toggle-transparency'.
 dotspacemacs-active-transparency 90
 ;; A value from the range (0..100), in increasing opacity, which describes the
 ;; transparency level of a frame when it's inactive or deselected. Transparency
 ;; can be toggled through `toggle-transparency'.
 dotspacemacs-inactive-transparency 90
 ;; If non nil unicode symbols are displayed in the mode line (e.g. for lighters)
 dotspacemacs-mode-line-unicode-symbols t
 ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth scrolling
 ;; overrides the default behavior of Emacs which recenters the point when
 ;; it reaches the top or bottom of the screen
 dotspacemacs-smooth-scrolling t
 ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
 dotspacemacs-smartparens-strict-mode nil
 ;; If non nil advises quit functions to keep server open when quitting.
 dotspacemacs-persistent-server nil
 ;; The default package repository used if no explicit repository has been
 ;; specified with an installed package.
 ;; Not used for now.
 dotspacemacs-default-package-repository nil
 )

;; Initialization Hooks
;; --------------------

(defun dotspacemacs/init ()
  "User initialization for Spacemacs. This function is called at the very
 startup."
  (add-to-list 'exec-path "/Users/endrebakkenstovner/Library/Haskell/bin/")

  (setq shell-file-name "/bin/bash")
  )

(defun dotspacemacs/config ()
  "This is were you can ultimately override default Spacemacs configuration.
This function is called at the very end of Spacemacs initialization."
  ;; Make alt-key work as normal
  (setq default-input-method "MacOSX")
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'nil)

  ;; Jump with
  ;; (global-set-key "æ" 'ace-jump-word-mode)

  (define-key evil-normal-state-map "j" 'evil-backward-char)
  (define-key evil-normal-state-map "k" 'evil-next-line)
  (define-key evil-normal-state-map "l" 'evil-previous-line)
  (define-key evil-normal-state-map "ø" 'evil-forward-char)

  (define-key evil-visual-state-map "j" 'evil-backward-char)
  (define-key evil-visual-state-map "k" 'evil-next-line)
  (define-key evil-visual-state-map "l" 'evil-previous-line)
  (define-key evil-visual-state-map "ø" 'evil-forward-char)
  ;; prettier font
  (set-face-attribute 'default nil
                      :family "Inconsolata" :height 175 :weight 'normal)

  ;; To avoid pixellated powerline
  (setq powerline-default-separator nil)

  ;; Turn off the guide-key menus
  ;; (guide-key-mode -1)

  ;; Centered buffer
  ;;(bzg-big-fringe-mode t)

  ;; Better keybindings for paredit
  (add-hook 'clojure-mode-hook (lambda () (local-set-key (kbd "M-s") 'save-buffer)))

  ;; Where the org-mode agenda files are stored
  (setq org-agenda-files (list "~/Dropbox/Org/"))

  ;; Save with M-s
  (global-set-key (kbd "M-s") 'save-buffer)

  ;; Switch window with M-o
  (global-set-key "\M-o" 'other-window)

  ;; Use line numbers
  (global-linum-mode 1)
  (linum-relative-toggle)
  ;; Use golden ratio mode on startup
  ;; (require 'golden-ratio)
  (golden-ratio-mode 1)

  ;; Tell me when I have used the arrow keys too much
  ;;(require 'annoying-arrows-mode)

  ;; Turn off the tildes in the fringe
  (global-vi-tilde-fringe-mode -1)

  ;;DELETE trailing whitespace on save
  (add-hook 'before-save-hook 'delete-trailing-whitespace)

  (add-to-list 'exec-path "/Users/endrebakkenstovner/Library/Haskell/bin/")

  (setq org-agenda-files '("~/Dropbox/Org/"))

  (add-to-list 'auto-mode-alist '("\\.txt$" . org-mode))





)

;; Custom variables
;; ----------------

;; Do not write anything in this section. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ahs-case-fold-search nil)
 '(ahs-default-range (quote ahs-range-whole-buffer))
 '(ahs-idle-interval 0.25)
 '(ahs-idle-timer 0 t)
 '(ahs-inhibit-face-list nil)
 '(paradox-github-token t)
 '(ring-bell-function (quote ignore) t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
