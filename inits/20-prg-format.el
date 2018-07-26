(unless (require 'prettier-js nil t)
  (package-install 'prettier-js))
(defun my/use-prettier-from-node-modules ()
  "use node_modules/.bin/prettier if exists"
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (prettier (and root
                      (expand-file-name "node_modules/.bin/prettier"
                                        root))))
    (when (and prettier (file-executable-p prettier))
      (setq-local prettier-js-command prettier))))
(add-hook 'prettier-js-mode-hook #'my/use-prettier-from-node-modules)
(add-hook 'web-mode-hook 'prettier-js-mode)
