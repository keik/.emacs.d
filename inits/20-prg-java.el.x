(add-hook 'java-mode-hook
  (lambda ()
    (define-key java-mode-map (kbd "C-c C-c") 'compile)
    (set (make-local-variable 'compile-command)
      (let ((file (file-name-nondirectory buffer-file-name)))
        (format "jc %s" file)))))
