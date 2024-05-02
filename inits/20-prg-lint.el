;;; 20-prg-lint.el --- settings for Lint
;;; Commentary:
;;; Code:
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
                  ruby-chef-cookstyle
                  ruby-jruby
                  ruby-rubocop
                  typescript-tslint
                  )
                )

  (flycheck-define-checker bundle/ruby-rubocop
    "A Ruby syntax and style checker using the RuboCop tool.
   Puts .dir-locals.el to each project root with contents

     ((ruby-mode . ((flycheck-checker . bundle/ruby-rubocop))))

  "
    :command
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
    :modes (ruby-mode)
    )
  (add-to-list 'flycheck-checkers 'bundle/ruby-rubocop t)

  :hook
  (emacs-lisp-mode . flycheck-mode)
  )
;;; 20-prg-lint.el ends here
