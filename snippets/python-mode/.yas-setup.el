(defun python-split-args (arg-string)
  "Split a python argument string into ((name, default)..) tuples"
  (mapcar (lambda (x)
             (split-string x "[[:blank:]]*=[[:blank:]]*" t))
          (split-string arg-string "[[:blank:]]*,[[:blank:]]*" t)))

(defun python-args-to-docstring ()
  "return docstring format for the python arguments in yas-text"
  (let* ((indent (concat "\n" (make-string (current-column) 32)))
         (args (python-split-args yas-text))
         (max-len (if args (apply 'max (mapcar (lambda (x) (length (nth 0 x))) args)) 0))
         (formatted-args (mapconcat
                (lambda (x)
                   (concat (nth 0 x) (make-string (- max-len (length (nth 0 x))) ? ) " -- "
                           (if (nth 1 x) (concat "\(default " (nth 1 x) "\)"))))
                args
                indent)))
    (unless (string= formatted-args "")
      (mapconcat 'identity (list "Keyword Arguments:" formatted-args) indent))))

;; (add-hook 'python-mode-hook
;;           '(lambda () (set (make-local-variable 'yas-indent-line) 'fixed)))


;; (defun py-yas-import-to-top ()
;;   "Moves all imports commented with # py-yas-top to the top of the file and removes the comment.

;;   The point of this function is to be able to include required
;;   imports in yasnippet-snippets. Since snippets are often
;;   expanded within code blocks, the imports they have included
;;   need to be moved to the top of the file. Blindly inserting and
;;   moving imports to the top of the file can break stuff, or lead
;;   to duplicate imports, therefore it only makes sense to use this
;;   function if you have python-isort and py-isort.el installed.

;;   Example:

;;   If you have a snippet to insert

;;       subprocess($1, shell=True)

;;   You can update this to include the import like so:

;;       from subprocess import call # py-yas-top
;;       subprocess($1, shell=True)

;;   After exiting the snippet, the import will be moved to the top
;;   of the file, where isort will insert it at the correct
;;   place (or remove it, if it is a duplicate.)"

;;   (interactive)
;;   (let ((python-buffer-string (buffer-substring-no-properties (point-min) (point-max)))
;;         (buffer-to-modify (current-buffer)))
;;     (with-temp-buffer
;;       (insert python-buffer-string)
;;       (let* ((find-marked-import-lines-regex "^ *\\(from\\)*.*import .* *# * py-yas-top *$")
;;              (regions-to-delete (reverse (s-matched-positions-all find-marked-import-lines-regex (buffer-string) 0)))
;;              (lines-to-move-to-top (s-match-strings-all find-marked-import-lines-regex (buffer-string))))
;;         ;; Delete all the parts marked with # py-yas-top
;;         (dolist (region regions-to-delete)
;;           (kill-region (car region) (1+ (cdr region))))
;;         ;; Add the deleted lines to the top.
;;         (dolist (import-line lines-to-move-to-top)
;;           (goto-char (point-min))
;;           (insert (s-trim-left (first (split-string (first import-line) "#"))))
;;           (newline))
;;         ;; Paste temp buffer with modified code into original buffer.
;;         (setq py-yas--python-code (buffer-string))
;;           (with-current-buffer buffer-to-modify
;;             (kill-region (point-min) (point-max))
;;             (insert py-yas--python-code))))))

;; (when (require 'py-isort nil 'noerror)
;;   (add-hook 'python-mode-hook
;;             (lambda ()
;;               (add-hook 'yas-after-exit-snippet-hook 'py-yas-import-to-top nil 'make-it-local))))
