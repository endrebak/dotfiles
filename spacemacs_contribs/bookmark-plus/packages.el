(defvar bookmark-plus-packages '(bookmark+)
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defun bookmark-plus/init-bookmark-plus ()
  (require 'bookmark+)
)

(defvar bookmark-plus-excluded-packages '()
  "List of packages to exclude.")
