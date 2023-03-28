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

(use-package flycheck
  :ensure t
  :config
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
  (ruby-mode       . flycheck-mode)
  ;; (typescript-mode . flycheck-mode)
  (web-mode        . flycheck-mode)
  )

(flycheck-define-checker bundle/ruby-rubocop
  "A Ruby syntax and style checker using the RuboCop tool.
   Puts .dir-locals.el to each project root with contents

     ((ruby-mode . ((flycheck-checker . bundle/ruby-rubocop))))

  "
  :command ;; ("ruby" "--version")
  ("bundle" "ex" "rubocop" "--format" "emacs"
   (config-file "--config" flycheck-rubocoprc)
   source)
  :error-patterns
  ((warning line-start
            (file-name) ":" line ":" column ": " (or "C" "W") ": " (message)
            line-end)
   (error line-start
          (file-name) ":" line ":" column ": " (or "E" "F") ": " (message)
          line-end))
  :modes (ruby-mode))
