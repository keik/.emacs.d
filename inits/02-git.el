(unless (require 'magit nil t)
  (package-install 'magit))

(setq magit-blame-heading-format "%.7H %-20a %C %s")

;; show chagnes on Git at line
(unless (require 'git-gutter nil t)
  (package-install 'git-gutter))
(global-git-gutter-mode +1)
(git-gutter:linum-setup)
