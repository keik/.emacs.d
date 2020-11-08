(defun my/use-prettier-from-node-modules ()
  "use node_modules/.bin/prettier if exists"
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (prettier (if root
                       (expand-file-name "node_modules/.bin/prettier" root)
                     "prettier")))
    (when (and prettier (file-executable-p prettier))
      (setq-local prettier-js-command prettier))))

(use-package prettier-js
  :ensure t
  :hook
  (web-mode . prettier-js-mode)
  (typescript-mode . prettier-js-mode)
  (prettier-js-mode . my/use-prettier-from-node-modules)
  )
