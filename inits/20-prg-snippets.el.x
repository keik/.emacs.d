(unless (require 'yasnippet nil 'noerror)
  (package-install 'yasnippet))
(yas-global-mode 1)
(with-eval-after-load 'yasnippet
  (setq yas-snippet-dirs (remq 'yas-installed-snippets-dir yas-snippet-dirs)))
