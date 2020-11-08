(unless (require 'magit nil t)
  (package-install 'magit))

(setq magit-blame-heading-format "%.7H %-20a %C %s")

;; show chagnes on Git at line
(unless (require 'git-gutter nil t)
  (package-install 'git-gutter))
(global-git-gutter-mode +1)
(git-gutter:linum-setup)

(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-keep-variants nil)


(cond (window-system
(setq x-select-enable-clipboard t)
))
