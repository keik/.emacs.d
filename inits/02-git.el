(use-package magit
  :ensure t
  :config
  (setq magit-blame-heading-format "%.7H %-20a %C %s")
)

(use-package helm-git-grep
  :ensure t
  :bind
  ("C-c g" . helm-git-grep)
)
;; show chagnes on Git at line
;; (unless (require 'git-gutter nil t)
;;   (package-install 'git-gutter))
;; (global-git-gutter-mode +1)
;; (git-gutter:linum-setup)
