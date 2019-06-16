(use-package web-mode)

(add-to-list 'auto-mode-alist '("\\.jsx?$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tsx?$" . web-mode))

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-enable-auto-indentation nil)
  (setq web-mode-attr-indent-offset 2)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-sql-indent-offset 2)
  (setq indent-tabs-mode nil)
  (setq tab-width 2)
  (add-to-list 'web-mode-indentation-params '("lineup-args" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-calls" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-concats" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-quotes" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-ternary" . nil))
  (add-to-list 'web-mode-indentation-params '("case-extra-offset" . nil))
  (when (string-equal "tsx" (file-name-extension buffer-file-name))
    (setup-tide-mode))
  )

(add-hook 'web-mode-hook 'my-web-mode-hook)

;;; Forgotten the purpose of follows... remove this
;; (setq web-mode-content-types-alist
;;   (if (boundp 'web-mode-content-types-alist) web-mode-content-types-alist '()))
;; (add-to-list 'web-mode-content-types-alist '("jsx" . "\\.jsx?$"))
;;
;; (defadvice web-mode-highlight-part (around tweak-jsx activate)
;;   (message (format "web-mode-content-type: %s" web-mode-content-type))
;;   (if (equal web-mode-content-type "jsx")
;;     (let ((web-mode-enable-part-face nil))
;;       ad-do-it)
;;      ad-do-it))

(use-package tide
  :ensure t
  :after (typescript-mode company flycheck)
  :hook ((typescript-mode . tide-setup)
         (typescript-mode . tide-hl-identifier-mode)
         (before-save . tide-format-before-save))
  :config
  (setq company-tooltip-align-annotations t)
  ;; Now no settings of TypeScript (Not TSX). Consider later.
  ;; (add-hook 'typescript-mode-hook #'setup-tide-mode)
  )

(defun setup-tide-mode ()
  "See https://github.com/ananthakumaran/tide ."
  (interactive)
  (tide-setup)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))


