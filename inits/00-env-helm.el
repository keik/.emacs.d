(use-package helm
  :ensure t
  :bind
  ;;("C-x b" . helm-buffers-list)
  ("C-x C-f" . helm-find-files)
  ("C-x C-r" . helm-recentf)
  ("C-x b" . helm-mini)
  ("M-x" . helm-M-x)
  ("M-y" . helm-show-kill-ring)
  :config
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to do persistent action
  (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
  (define-key helm-map (kbd "C-z")  'helm-select-action)
  (define-key helm-map (kbd "C-w")  'kill-region) ;; helm セクションで無効化される C-w kill-region を復活
  )

;; おためし
(setq recentf-max-menu-items 1000)
(setq recentf-max-saved-items 1000)
