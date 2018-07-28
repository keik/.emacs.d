(unless (require 'flycheck nil t)
  (package-install 'flycheck))

(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(javascript-jshint)))

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

(add-hook 'web-mode-hook '(lambda ()
                            (flycheck-add-mode 'javascript-eslint 'web-mode)
                            (my/use-eslint-from-node-modules)
                            (flycheck-mode)))
(add-hook 'coffee-mode-hook 'flycheck-mode)
(add-hook 'python-mode-hook 'flycheck-mode)
(add-hook 'java-mode-hook 'flycheck-mode)
(add-hook 'ruby-mode-hook '(lambda ()
                             (setq-local flycheck-ruby-rubocop-executable "echo") ;dummy to prevent missing execution and marked as disabled...
                             (setq-local flycheck-command-wrapper-function
                                         (lambda (command)
                                           (append '("bundle" "exec" "rubocop") (cdr command))))
                             (flycheck-mode)))
;; (unless (require 'flycheck-flow nil t)
;;   (package-install 'flycheck-flow))
