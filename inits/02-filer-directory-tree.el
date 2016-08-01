(unless (require 'sr-speedbar nil t)
  (package-install 'sr-speedbar))
(global-set-key (kbd "C-x C-j") 'sr-speedbar-toggle)
(setq speedbar-show-unknown-files t)
