(defvar endrebak-packages '(annoying-arrows-mode)
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defun endrebak/init-annoying-arrows-mode ()
  (global-annoying-arrows-mode 1)
  (setq annoying-arrows-too-far-count 11))

 ; (add-annoying-arrows-advice evil-forward-char '(smart-forward))
 ; (add-annoying-arrows-advice evil-backward-char '(smart-backward))
 ; (add-annoying-arrows-advice evil-next-line '(smart-forward))
 ; (add-annoying-arrows-advice evil-previous-line '(smart-backward))
 ; (add-annoying-arrows-advice evil-delete-backward-char '(evil-delete-backward-word)))

(defvar endrebak-excluded-packages '()
  "List of packages to exclude.")
