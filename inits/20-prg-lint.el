(defun my/use-eslint-from-node-modules ()
  "See http://emacs.stackexchange.com/questions/21205/flycheck-with-file-relative-eslint-executable ."
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint (and root
                      (expand-file-name "node_modules/eslint/bin/eslint.js"
                                        root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))

;; (defun my/use-rubocop-from-bundle ()
;;   (setq-local flycheck-ruby-rubocop-executable "echo") ;dummy to prevent missing execution and marked as disabled...
;;   (setq-local flycheck-command-wrapper-function
;;               (lambda (command)
;;                 (append '("bundle" "exec" "rubocop") (cdr command)))))

(use-package flycheck
  :ensure t

  :config
  ;; 使わない
  (setq-default flycheck-disabled-checkers
                '(
                  ember-template
                  handlebars
                  chef-foodcritic
                  ruby-standard
                  ruby-reek
                  ruby-rubylint
                  ruby-jruby
                  typescript-tslint
                  )
                )

  ;; execute の探し方をカスタマイズ
  (add-hook 'flycheck-mode-hook 'my/use-eslint-from-node-modules)
  ;; (add-hook 'ruby-mode-hook 'my/use-rubocop-from-bundle)

  ;; major-mode に checker を追加
  (flycheck-add-mode 'javascript-eslint 'web-mode)

  :bind
  ("C-c C-e C-c" . flycheck-buffer)
  ("C-c C-e C-n" . flycheck-next-error)
  ("C-c C-e C-p" . flycheck-previous-error)

  :hook
  ;; (coffee-mode     . flycheck-mode)
  (emacs-lisp-mode . flycheck-mode)
  ;; (go-mode         . flycheck-mode)
  ;; (python-mode     . flycheck-mode)
  ;; (ruby-mode       . flycheck-mode)
  ;; (typescript-mode . flycheck-mode)
  (web-mode        . flycheck-mode)
  )
