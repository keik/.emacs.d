(unless (require 'coffee-mode nil t)
  (package-install 'coffee-mode))

(add-to-list 'auto-mode-alist '("\\.coffee?$" . coffee-mode))
