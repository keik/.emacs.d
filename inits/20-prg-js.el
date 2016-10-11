(unless (require 'js2-mode nil t)
  (package-install 'js2-mode))

(add-to-list 'auto-mode-alist '("\\.jsx?$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.es$" . web-mode))

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (make-local-variable 'exec-path)
  ;; TODO exec local node_modules
  ;;(push "/Users/keik/tmp/eeeafea/node_modules/.bin/" exec-path)
  (setq web-mode-attr-indent-offset nil)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-sql-indent-offset 2)
  (setq indent-tabs-mode nil)
  (setq tab-width 2))
(add-hook 'web-mode-hook 'my-web-mode-hook)

(setq web-mode-content-types-alist
  '(("jsx" . "\\.jsx?$")))

(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (message (format "web-mode-content-type: %s" web-mode-content-type))
  (if (equal web-mode-content-type "jsx")
    (let ((web-mode-enable-part-face nil))
      ad-do-it)
     ad-do-it))
