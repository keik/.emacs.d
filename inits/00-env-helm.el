(unless (require 'helm nil t)
  (package-install 'helm))

(require 'helm-config)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
