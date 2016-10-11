(unless (require 'web-mode nil t)
  (package-install 'web-mode))

(add-to-list 'auto-mode-alist '("\\.json$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.eslintrc$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.babelrc$" . web-mode))

(setq web-mode-content-types-alist
  (if (boundp 'web-mode-content-types-alist) web-mode-content-types-alist '()))
(add-to-list 'web-mode-content-types-alist '("json" . "\\.eslintrc$"))
(add-to-list 'web-mode-content-types-alist '("json" . "\\.babelrc$"))
