(defalias 'perl-mode 'cperl-mode)
(add-hook 'cperl-mode-hook
  '(lambda ()
     (make-local-variable 'compile-command)
     (setq compile-command
       (concat "perl " (buffer-file-name)))
     (cperl-define-key "\C-c\C-c" 'compile)))
