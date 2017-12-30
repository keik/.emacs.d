(unless (require 'flycheck nil t)
  (package-install 'flycheck))
(add-hook 'web-mode-hook 'flycheck-mode)
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(javascript-jshint)))

(unless (require 'flycheck-flow nil t)
  (package-install 'flycheck-flow))
(flycheck-add-mode 'javascript-eslint 'web-mode)
;; (flycheck-add-mode 'javascript-flow 'web-mode)
;; (flycheck-select-checker 'javascript-eslint)
;; (flycheck-add-next-checker 'javascript-eslint 'javascript-flow)

(add-hook 'coffee-mode-hook 'flycheck-mode)
(add-hook 'python-mode-hook 'flycheck-mode)
(add-hook 'java-mode-hook 'flycheck-mode)
(add-hook 'ruby-mode-hook 'flycheck-mode)
