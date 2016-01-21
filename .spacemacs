;; -*- mode: dotspacemacs -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

;
;; dotspacemacs-additional-packages
;

(defun dotspacemacs/layers ()
  "Configuration Layers declaration."
  (setq-default
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (ie. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '("~/.emacs.d/private/")
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers '(emacs-lisp git (python :variables python-test-runner 'pytest python-enable-yapf-format-on-save t) auto-completion org syntax-checking themes-megapack markdown github ipython-notebook (evil-snipe :variables evil-snipe-enable-alternate-f-and-t-behaviors t) ess fasd)  ;;evil-easymotion  nim  clojure ipython-notebook avy haskell endrebak evil-annoying-arrows smex fasd dash e clojure


   dotspacemacs-additional-packages '(py-isort)
   ;; A list of packages and/or extensions that will not be install and loaded.
   ;; dotspacemacs-excluded-packages '()
   ;; ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; Specify the startup banner. If the value is an integer then the
   ;; banner with the corresponding index is used, if the value is `random'
   ;; then the banner is chosen randomly among the available banners, if
   ;; the value is nil then no banner is displayed.
   dotspacemacs-startup-banner 'random
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(monokai)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
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
   dotspacemacs-guide-key-delay 0.1
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil ;; to boost the loading time.
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up.
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX."
   dotspacemacs-fullscreen-use-non-native t
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line.
   dotspacemacs-mode-line-unicode-symbols nil
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen.
   dotspacemacs-smooth-scrolling nil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   dotspacemacs-smartparens-strict-mode nil
   ;; If non nil advises quit functions to keep server open when quitting.
   dotspacemacs-persistent-server nil
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now.
   dotspacemacs-default-package-repository nil)
  ;; User initialization goes here

  ;; (add-to-list 'exec-path "/Users/endrebakkenstovner/Library/Haskell/bin/")

  (setq shell-file-name "/bin/bash")

  ;; (setenv "RUST_SRC_PATH" "/Users/endrebakkenstovner/local/rustc-1.1.0/src")
  ;; (add-hook 'rust-mode-hook #'racer-mode)
  ;; (add-hook 'racer-mode-hook #'eldoc-mode)


  ;; (add-hook 'racer-mode-hook #'company-mode)

  ;; (global-set-key (kbd "TAB") #'company-indent-or-complete-common) ;
  ;; (setq company-tooltip-align-annotations t)
  ;; (setq racer-rust-src-path "/Users/endrebakkenstovner/local/rustc-1.1.0/src/")
  ;; (setq racer-cmd "/Users/endrebakkenstovner/local/racer/target/release/racer")
  ;; (add-to-list 'load-path "/Users/endrebakkenstovner/local/racer/editors/emacs")
  )


(defun dotspacemacs/config ()
"Configuration function.
 This function is called at the very end of Spacemacs initialization after
layers configuration."

; dont prompt to eval ipython
;; (setq org-confirm-babel-evaluate nil)
; let keyword ipython be evaluated
;(add-to-list 'org-src-lang-modes '("ipython" . python))

;; (evilem-default-keybindings "<f8>")

(defun run-pytest-on-save ()
  (interactive)
  (if (eq major-mode 'python-mode)
      (pytest-module "-vv")))

;; (add-hook 'after-save-hook 'run-pytest-on-save)
;; (remove-hook 'after-save-hook 'run-pytest-on-save)

(defvar mk-minor-mode-map (make-keymap) "mk-minor-mode keymap.")

;; Switch window with M-o
(define-key mk-minor-mode-map (kbd "M-o") 'other-window)

;; Invoke fasd find fiile
(define-key mk-minor-mode-map (kbd "M-f") 'fasd-find-file)

;; Invoke fasd find fiile
(define-key mk-minor-mode-map (kbd "M-p") 'helm-projectile)

;; Save with M-s
(define-key mk-minor-mode-map (kbd "M-s") 'save-buffer)

(define-key mk-minor-mode-map (kbd "M-d") 'helm-semantic-or-imenu)
(define-key mk-minor-mode-map (kbd "M-r") 'helm-resume)
(define-key mk-minor-mode-map (kbd "M-t") 'run-pytest-on-save)
(define-key mk-minor-mode-map (kbd "M-j") 'helm-all-mark-rings)
;; (define-key mk-minor-mode-map (kbd "M-i") 'helm-show-kill-ring)
(define-key mk-minor-mode-map (kbd "M-f") 'helm-mini)
(define-key mk-minor-mode-map (kbd "M-a") 'ace-window)

(define-key mk-minor-mode-map (kbd "M-C-w") 'sp-beginning-of-sexp)

;; (define-key mk-minor-mode-map (kbd "<f9>") 'org-edit-src-code)
;; (define-key mk-minor-mode-map (kbd "<f10>") 'org-edit-src-exit)

;; (define-key mk-minor-mode-map (kbd "M-w") 'cider-repl-backward-input)
;; (define-key mk-minor-mode-map (kbd "M-t") 'cider-repl-forward-input)


(eval-after-load "helm"
  '(define-key helm-map (kbd "<f5>") 'ace-jump-helm-line-execute-action))


;; Movement
;; (evil-leader/set-key "ol" 'sp-forward-sexp)
;; (evil-leader/set-key "oh" 'sp-backward-sexp)
;; (evil-leader/set-key "ok" 'sp-down-sexp)
;; (evil-leader/set-key "oj" 'sp-up-sexp)

(evil-leader/set-key "ow" 'sp-splice-sexp)
(evil-leader/set-key "oe" 'sp-splice-sexp-killing-forward)
(evil-leader/set-key "or" 'sp-splice-sexp-killing-backward)
(evil-leader/set-key "ot" 'sp-splice-sexp-killing-around)
(evil-leader/set-key "os" 'sp-kill-sexp)
(evil-leader/set-key "oa" 'sp-backward-kill-sexp)
(evil-leader/set-key "od" 'sp-backward-copy-sexp)
(evil-leader/set-key "of" 'sp-copy-sexp)
(evil-leader/set-key "oz" 'sp-transpose-sexp)
(evil-leader/set-key "oq" 'sp-backward-unwrap-sexp)
(evil-leader/set-key "og" 'sp-convolute-sexp)
(evil-leader/set-key "oc" 'sp-unwrap-sexp)
(evil-leader/set-key "ov" 'sp-absorb-sexp)
(evil-leader/set-key "ob" 'sp-emit-sexp)
(evil-leader/set-key "ou" 'sp-extract-before-sexp)
(evil-leader/set-key "oi" 'sp-extract-after-sexp)
(evil-leader/set-key "oo" 'sp-split-sexp)
(evil-leader/set-key "ox" 'sp-join-sexp)
(evil-leader/set-key "oh" 'sp-rewrap-sexp)
(evil-leader/set-key "oj" 'sp-swap-enclosing-sexp)
(evil-leader/set-key "ol" 'sp-forward-slurp-sexp)
(evil-leader/set-key "ok" 'sp-backward-slurp-sexp)
(evil-leader/set-key "on" 'sp-backward-barf-sexp)
(evil-leader/set-key "om" 'sp-forward-barf-sexp)
(evil-leader/set-key "oy" 'sp-add-to-previous-sexp)
(evil-leader/set-key "op" 'sp-add-to-next-sexp)

(evil-leader/set-key "mow" 'sp-backward-sexp)
(evil-leader/set-key "moe" 'sp-forward-sexp)
(evil-leader/set-key "mor" 'sp-down-sexp)
(evil-leader/set-key "mot" 'sp-up-sexp)
(evil-leader/set-key "moa" 'sp-backward-down-sexp)
(evil-leader/set-key "mos" 'sp-backward-up-sexp)
(evil-leader/set-key "mod" 'sp-previous-sexp)
(evil-leader/set-key "mof" 'sp-next-sexp)
(evil-leader/set-key "moq" 'sp-end-of-sexp)
(evil-leader/set-key "mog" 'sp-beginning-of-sexp)
(evil-leader/set-key "mov" 'sp-beginning-of-previous-sexp)
(evil-leader/set-key "mob" 'sp-beginning-of-next-sexp)
(evil-leader/set-key "mou" 'sp-end-of-previous-sexp)
(evil-leader/set-key "moi" 'sp-end-of-next-sexp)


;; Do not automatically write ) after (
(smartparens-global-mode nil)

(define-minor-mode mk-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  t " mk" 'mk-minor-mode-map)

(mk-minor-mode 1)
;; (defadvice yes-or-no-p (around prevent-dialog activate)
;;   "Prevent yes-or-no-p from activating a dialog"
;;   (let ((use-dialog-box nil))
;;     ad-do-it))
;; (defadvice y-or-n-p (around prevent-dialog-yorn activate)
;;   "Prevent y-or-n-p from activating a dialog"
;;   (let ((use-dialog-box nil))
;;     ad-do-it))

(setq evil-ex-substitute-global t)

;; Make screen grey when using avy
(setq avy-background t)
(setq avy-highlight-first nil)
(setq avy-all-windows t)

;; Make decision trees less weird at the expense of terseness
(setq avy-style 'de-bruijn)
(setq avy-timeout-seconds 0.3)

;; Display avy chars in uppercase but enter in lower
(setq avy-keys
      '(?A ?S ?D ?F ?H ?J ?K ?L))
(setq avy-translate-char-function #'upcase)

;; Make alt-key work as normal
(setq default-input-method "MacOSX")
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'nil)


(defun narrow-or-widen-dwim (p)
  "Widen if buffer is narrowed, narrow-dwim otherwise.
Dwim means: region, org-src-block, org-subtree, or defun,
whichever applies first. Narrowing to org-src-block actually
calls `org-edit-src-code'.

With prefix P, don't widen, just narrow even if buffer is
already narrowed."
  (interactive "P")
  (declare (interactive-only))
  (cond ((and (buffer-narrowed-p) (not p)) (widen))
        ((region-active-p)
         (narrow-to-region (region-beginning) (region-end)))
        ((derived-mode-p 'org-mode)
         ;; `org-edit-src-code' is not a real narrowing
         ;; command. Remove this first conditional if you
         ;; don't want it.
         (cond ((ignore-errors (org-edit-src-code))
                (delete-other-windows))
               ((ignore-errors (org-narrow-to-block) t))
               (t (org-narrow-to-subtree))))
        ((derived-mode-p 'latex-mode)
         (LaTeX-narrow-to-environment))
        (t (narrow-to-defun))))


;; (defun shell-command-on-buffer ()
;;   "Asks for a command and executes it in inferior shell with current buffer
;; as input."
;;   (interactive)
;;   (shell-command-on-buffer
;;    (point-min) (point-max)
;;    (read-shell-command "shell command on buffer: ")))
;; (setq narrow-to-defun-or-widen-next-command )
;; (defun narrow-to-defun-or-widen ()
;;   (if )
;;     )


;; Use home row keys for various movements
(define-key evil-normal-state-map (kbd "0") 'delete-window) ;; _ does same thing as 0
(define-key evil-normal-state-map (kbd "<down>") 'evil-next-line)
(define-key evil-normal-state-map (kbd "<up>") 'evil-previous-line)
(define-key evil-normal-state-map (kbd "<f3>") 'spacemacs/next-useful-buffer)
(define-key evil-normal-state-map (kbd "<f4>") 'spacemacs/previous-useful-buffer)
(define-key evil-normal-state-map "K" 'kill-this-buffer)
(define-key evil-normal-state-map (kbd "<f5>") 'avy-goto-char-timer)
(define-key evil-normal-state-map (kbd "<f6>") 'spacemacs/helm-project-smart-do-search-region-or-symbol)
(define-key evil-normal-state-map (kbd "<f7>") 'narrow-or-widen-dwim)
(define-key evil-normal-state-map (kbd "<f8>") 'helm-swoop)
(define-key evil-normal-state-map (kbd "<f9>") 'spacemacs/helm-swoop-region-or-symbol)
(define-key evil-normal-state-map (kbd "<f10>") 'whitespace-mode)
(define-key evil-normal-state-map (kbd "<f11>") 'widen)
(define-key evil-normal-state-map (kbd "<f12>") 'eval-expression)
(define-key evil-normal-state-map "j" 'pop-to-mark-command)
(define-key evil-normal-state-map (kbd "C-l") 'evil-backward-paragraph)
(define-key evil-normal-state-map (kbd "C-k") 'evil-forward-paragraph)
(define-key evil-normal-state-map (kbd "M-l") 'evil-backward-indentation-begin)
(define-key evil-normal-state-map (kbd "M-k") 'evil-forward-indentation-begin)
;; (define-key evil-normal-state-map (kbd "M-j") 'sp-backward-symbol)
;; (define-key evil-normal-state-map (kbd "M-ø") 'forward-symbol)

;; (define-key evil-visual-state-map "l" 'avy-goto-line)
(define-key evil-visual-state-map (kbd "<down>") 'evil-next-line)
(define-key evil-visual-state-map (kbd "<up>") 'evil-previous-line)
(define-key evil-visual-state-map (kbd "<f5>") 'avy-goto-char-timer)
(define-key evil-visual-state-map (kbd "<f6>") 'spacemacs/helm-project-smart-do-search-region-or-symbol)
(define-key evil-visual-state-map (kbd "C-l") 'evil-backward-paragraph)
(define-key evil-visual-state-map (kbd "C-k") 'evil-forward-paragraph)
(define-key evil-visual-state-map (kbd "M-l") 'evil-backward-indentation-begin)
(define-key evil-visual-state-map (kbd "M-k") 'evil-forward-indentation-begin)
;; (define-key evil-visual-state-map (kbd "M-j") 'sp-backward-symbol)
;; (define-key evil-visual-state-map (kbd "M-ø") 'forward-symbol)


;; (define-key evil-motion-state-map "l" 'avy-goto-line)
(define-key evil-motion-state-map "k" 'evil-next-line)
(define-key evil-motion-state-map "l" 'evil-previous-line)
;; (define-key evil-motion-state-map "k" 'avy-goto-word-or-subword-1)
(define-key evil-motion-state-map (kbd "<f5>") 'avy-goto-char-timer)
(define-key evil-motion-state-map (kbd "<f6>") 'spacemacs/helm-project-smart-do-search-region-or-symbol)
(define-key evil-motion-state-map (kbd "C-l") 'evil-backward-paragraph)
(define-key evil-motion-state-map (kbd "C-k") 'evil-forward-paragraph)
(define-key evil-motion-state-map (kbd "M-l") 'evil-backward-indentation-begin)
(define-key evil-motion-state-map (kbd "M-k") 'evil-forward-indentation-begin)
;; (define-key evil-motion-state-map (kbd "M-j") 'sp-backward-symbol)
;; (define-key evil-motion-state-map (kbd "M-ø") 'forward-symbol)


(define-key evil-insert-state-map (kbd "<f5>") 'avy-goto-char-timer)
(define-key evil-insert-state-map (kbd "<f7>") 'yas-expand)


;; prettier font
(set-face-attribute 'default nil
                    :family "Inconsolata" :height 140 :weight 'normal)



;; To avoid pixellated powerline
(setq powerline-default-separator 'rounded)

;; Make evil-snipe override evil fFtT;,
;; (evil-snipe-mode 1)
;; (setq evil-snipe-override-mode t)
;; (setq evil-snipe-repeat-keys t)
;; (setq evil-snipe-scope 'whole-buffer)
;; (setq evil-snipe-repeat-scope 'whole-buffer)
;; (setq evil-snipe-auto-scroll nil)

;; do not need to reload buffers to see git branch change
(global-auto-revert-mode 1)
(setq auto-revert-check-vc-info t)


;; Turn off the tildes in the fringe
(global-vi-tilde-fringe-mode -1)

;;DELETE trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(add-to-list 'exec-path "/Users/endrebakkenstovner/Library/Haskell/bin/")

(setq org-agenda-files '("~/Dropbox/Org/"))

(add-to-list 'auto-mode-alist '("\\.txt$" . org-mode))

(setq yas-snippet-dirs '("~/Dropbox/dotfiles/snippets/"))

(setq evil-snipe-enable-alternate-f-and-t-behaviors t)

(setq-default dotspacemacs-configuration-layers '(evil-snipe :variables evil-snipe-enable-alternate-f-and-t-behaviors t ))
;; (setq-default dotspacemacs-configuration-layers
;;               '((c-c++ :variables c-c++-enable-clang-support t)))
;; (defun custom-persp/python ()
;;   (interactive)
;;   (custom-persp "python"
;;                 (progn
;;                   (layout-triple-columns)
;;                   (select-window-3)
;;                   (python-start-or-switch-repl))))

;;   (custom-persp/python)
;;   (define-key mk-minor-mode-map (kbd "C-p") 'custom-persp/python)

;; Do not write anything past this comment. This is where Emacs will
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
 '(avy-lead-face ((t (:background "DeepSkyBlue3" :foreground "white"))))
 '(avy-lead-face-0 ((t (:background "DeepSkyBlue3" :foreground "white"))))
 '(avy-lead-face-1 ((t (:background "DeepSkyBlue3" :foreground "white"))))
 '(avy-lead-face-2 ((t (:background "DeepSkyBlue3" :foreground "white"))))
 '(aw-leading-char-face ((t (:foreground "red" :height 15.0))))
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil))))))
