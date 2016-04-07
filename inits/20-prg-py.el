1;; ---------------------------------------------------------
;; Python

;; (add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
(add-hook 'python-mode-hook
  (lambda ()
    (define-key python-mode-map (kbd "C-c C-c") 'compile)
    (set (make-local-variable 'compile-command)
      (let ((file (file-name-nondirectory buffer-file-name)))
        (format "python %s" file)))))
