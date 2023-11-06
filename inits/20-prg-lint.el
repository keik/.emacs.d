;;; 20-prg-lint.el --- settings for Lint
;;; Commentary:
;;; Code:
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

(flycheck-define-checker bundle/ruby-rubocop
  "A Ruby syntax and style checker using the RuboCop tool.
   Puts .dir-locals.el to each project root with contents

     ((ruby-mode . ((flycheck-checker . bundle/ruby-rubocop))))

  "
  :command
  ("bundle" "ex" "rubocop" "--format" "emacs"
   (config-file "--config" flycheck-rubocoprc)
   source)
  ;; :modes (js-mode js-jsx-mode js2-mode js2-jsx-mode js3-mode rjsx-mode
  ;;                 typescript-mode js-ts-mode typescript-ts-mode tsx-ts-mode)
  :error-patterns
  ((warning line-start
            (file-name) ":" line ":" column ": " (or "C" "W") ": " (message)
            line-end)
   (error line-start
          (file-name) ":" line ":" column ": " (or "E" "F") ": " (message)
          line-end))
  :modes (ruby-mode)
  ;; :next-checkers ((warning . ruby))
  )

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
                  ruby-rubocop
                  ;; lsp
                  typescript-tslint
                  )
                )

  (add-to-list 'flycheck-checkers 'bundle/ruby-rubocop t)
  (add-hook 'flycheck-mode-hook 'my/use-eslint-from-node-modules)
  ;; (flycheck-add-mode 'javascript-eslint 'web-mode)
  ;; (flycheck-add-next-checker 'ruby 'bundle/ruby-rubocop)

  ;; :bind
  ;; ("C-c C-e C-c" . flycheck-buffer)
  ;; ("C-c C-e C-n" . flycheck-next-error)
  ;; ("C-c C-e C-p" . flycheck-previous-error)

  :hook
  ;; (coffee-mode     . flycheck-mode)
  (emacs-lisp-mode . flycheck-mode)
  ;; (go-mode         . flycheck-mode)
  ;; (python-mode     . flycheck-mode)
  (ruby-mode       . flycheck-mode)
  ;; (typescript-ts-mode . lsp)
  (typescript-mode . flycheck-mode)
  ;; (typescript-ts-mode . flycheck-mode)
  (web-mode        . flycheck-mode)
  (tsx-ts-mode     . flycheck-mode)
  )
;;; 20-prg-lint.el ends here
