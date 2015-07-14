;;; packages.el --- ace-jump-helm-line Layer packages File for Spacemacs
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

;; List of all packages to install and/or initialize. Built-in packages
;; which require an initialization must be listed explicitly in the list.
(setq ace-jump-helm-line-packages
    '(
      ace-jump-helm-line
      ;; package names go here
      ))

;; List of packages to exclude.
(setq ace-jump-helm-line-excluded-packages '())

;; For each package, define a function ace-jump-helm-line/init-<package-name>
;;
(defun ace-jump-helm-line/init-ace-jump-helm-line ()
  "Initialize my package"
  (:use-package ace-jump-helm-line)
  )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
