;;; 02-git.el --- settings for Git
;;; Commentary:
;;; Code:
(use-package magit
  :ensure t
  :config
  (setq magit-blame-heading-format "%.7H %-20a %C %s")
)

(use-package helm-git-grep
  :ensure t
  :bind
  ("C-c g" . helm-git-grep)
  :config
  (setq helm-allow-mouse nil)
)
;; show chagnes on Git at line
;; (unless (require 'git-gutter nil t)
;;   (package-install 'git-gutter))
;; (global-git-gutter-mode +1)
;; (git-gutter:linum-setup)
;;; 02-git.el ends here
