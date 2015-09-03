(when (require 'web-mode nil 'noerror)
  (add-to-list 'auto-mode-alist '("\\.html?$" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.jsp$" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.ect$" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tag$" . web-mode)) ;; for Riot.js tag
  (define-key web-mode-map (kbd "C-c C-v") 'browse-url-of-buffer))

(setq browse-url-browser-function 'browse-url-generic
  browse-url-generic-program "chromium")

;; zencoding
(when (require 'zencoding-mode nil 'noerror)
  (add-hook 'web-mode-hook 'zencoding-mode))
