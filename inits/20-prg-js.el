(unless (require 'js2-mode nil t)
  (package-install 'js2-mode))

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.es$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx$" . js2-jsx-mode))
(setq js2-strict-missing-semi-warning nil)
(setq js2-strict-trailing-comma-warning nil)

(add-hook 'js2-mode-hook
  (lambda ()
    (define-key js2-mode-map (kbd "C-c C-c") 'compile)
    (set (make-local-variable 'compile-command)
      (let ((file (file-name-nondirectory buffer-file-name)))
        (format "node %s" file)))))
