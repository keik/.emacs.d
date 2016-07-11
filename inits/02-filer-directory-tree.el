(unless (require 'sr-speedbar nil t)
  (package-install 'sr-speedbar))
(global-set-key (kbd "C-x C-j") 'sr-speedbar-toggle)


;;(unless (require 'neotree nil t)
;;  (package-install 'neotree))
;;(global-set-key (kbd "C-x C-j") 'neotree-toggle)
