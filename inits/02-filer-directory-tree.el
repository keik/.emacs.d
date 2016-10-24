(unless (require 'neotree nil t)
  (package-install 'neotree))
(global-set-key (kbd "C-x C-j") 'neotree-toggle)
