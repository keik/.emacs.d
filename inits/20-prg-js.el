(unless (require 'web-mode nil t)
  (package-install 'web-mode))

(add-to-list 'auto-mode-alist '("\\.jsx?$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.es$" . web-mode))

(defun my-web-mode-hook ()
  "Hooks for Web mode."
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
  ;;(add-to-list 'web-mode-indentation-params '("case-extra-offset" . nil))
  )

(add-hook 'web-mode-hook 'my-web-mode-hook)

(setq web-mode-content-types-alist
  (if (boundp 'web-mode-content-types-alist) web-mode-content-types-alist '()))
(add-to-list 'web-mode-content-types-alist '("jsx" . "\\.jsx?$"))

(defun my/use-eslint-from-node-modules ()
  "http://emacs.stackexchange.com/questions/21205/flycheck-with-file-relative-eslint-executable"
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint (and root
                      (expand-file-name "node_modules/eslint/bin/eslint.js"
                                        root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))
(add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)

(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (message (format "web-mode-content-type: %s" web-mode-content-type))
  (if (equal web-mode-content-type "jsx")
    (let ((web-mode-enable-part-face nil))
      ad-do-it)
     ad-do-it))
