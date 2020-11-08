(require 'package)
(setq package-check-signature nil)
(add-to-list 'package-archives '("elpa" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
;;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

(package-initialize)
;;(package-refresh-contents)

(unless (require 'use-package nil t)
  (package-install 'use-package))

;; load inits
(unless (require 'init-loader nil t)
  (package-install 'init-loader))

(init-loader-load)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(xclip csv-mode yasnippet yaml-mode which-key web-mode use-package undo-tree typescript-mode smartrep rufo rspec-mode rbenv prettier-js popwin neotree multiple-cursors magit lsp-ui jedi init-loader inf-ruby helm gotest git-gutter flycheck exec-path-from-shell emmet-mode editorconfig cyberpunk-theme company-lsp coffee-mode anzu)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
