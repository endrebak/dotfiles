;;; packages.el --- ob-ipython Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3
(require 'use-package)

;; List of all packages to install and/or initialize. Built-in packages
;; which require an initialization must be listed explicitly in the list.
(setq ob-ipython-packages
    '(
      ob-ipython
      ))

;; List of packages to exclude.
(setq ob-ipython-excluded-packages '())

;; For each package, define a function ob-ipython/init-<package-name>
;;
(defun ob-ipython/init-ob-ipython ()
  "Initialize my package"
  (require 'ob-ipython)
  )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
