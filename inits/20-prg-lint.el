(unless (require 'flycheck nil t)
  (package-install 'flycheck))
(add-hook 'web-mode-hook 'flycheck-mode)
(add-hook 'js2-mode-hook 'flycheck-mode)
(add-hook 'js2-jsx-mode-hook 'flycheck-mode)
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(javascript-jshint)))
(flycheck-add-mode 'javascript-eslint 'js2-mode)
(flycheck-add-mode 'javascript-eslint 'js2-jsx-mode)
(add-hook 'python-mode-hook 'flycheck-mode)
(add-hook 'java-mode-hook 'flycheck-mode)
