(use-package web-mode
  :ensure t
  :mode ("\\.x?html?$"
         "\\.hbt$"
         "\\.ect$"
         "\\.jsp$"
         "\\.tag$"
         "\\.erb$"))

;; (define-key web-mode-map (kbd "C-c C-v") 'browse-url-of-buffer)

(setq web-mode-enable-auto-quoting nil)

(setq browse-url-browser-function 'browse-url-generic
  browse-url-generic-program "chrome")

;; zencoding
(use-package emmet-mode
  :ensure t
  :hook web-mode)
