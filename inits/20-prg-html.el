(unless (require 'web-mode nil t)
  (package-install 'web-mode))

(add-to-list 'auto-mode-alist '("\\.x?html?$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.hbt$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ect$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tag$" . web-mode))
(define-key web-mode-map (kbd "C-c C-v") 'browse-url-of-buffer)

(setq browse-url-browser-function 'browse-url-generic
  browse-url-generic-program "chrome")

;; zencoding
(unless (require 'emmet-mode nil t)
  (package-install 'emmet-mode))
(add-hook 'web-mode-hook 'emmet-mode)
