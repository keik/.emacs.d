;;; Code:
(defun my/use-flow-from-node-modules ()
  "Use flow server from node_moduels."
  (interactive)
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (flow (and root
                      (expand-file-name "node_modules/.bin/flow"
                                        root))))
    (when (and flow (file-executable-p flow))
      (setq-local lsp-clients-flow-server flow))))

;; (defun my/web-mode-on-tsx ()
;;   "Enable tide-mode only .tsx file."
;;   (message "aaaaaaaaaaaaaaaa")
;;   (when (string-equal "tsx" (file-name-extension buffer-file-name))
;;     (message "bbbbbbbbbbbbbbbb")
;;     (flycheck-add-next-checker 'lsp 'javascript-eslint)
;;     ))

(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "s-l")
  :hook
  ;; (lsp-mode . lsp-enable-which-key-integration)
  ;; (go-mode . lsp)
  (typescript-mode . lsp)
  ;; (yaml-mode . lsp)
  (web-mode . lsp)
  (web-mode . my/use-flow-from-node-modules)

  ;; ;; lsp checker が後にきてほしい
  ;; #1
  ;; :config
  ;; (add-to-list 'flycheck-checkers 'lsp)
  ;; (flycheck-add-next-checker 'javascript-eslint 'lsp)

  ;; #2
  ;; :config
  ;; (delete 'lsp flycheck-checkers)
  ;; (add-to-list 'flycheck-checkers 'lsp t)

  ;; (flycheck-add-next-checker 'lsp 'javascript-eslint)
  ;; :custom
  ;; (lsp-diagnostic-package ":none")
  :commands lsp)

;; (add-hook 'web-mode-hook 'my/use-flow-from-node-modules)

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)
;; (use-package company-lsp
;;   :ensure t
;;   :commands company-lsp)
;; if you are helm user
;; (use-package helm-lsp
;;   :ensure t
;;   :commands helm-lsp-workspace-symbol)
;; optionally if you want to use debugger
;; (use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language


;; orig================
;; ;;; Code:
;; (defun my/use-flow-from-node-modules ()
;;   "Use flow server from node_moduels."
;;   (interactive)
;;   (let* ((root (locate-dominating-file
;;                 (or (buffer-file-name) default-directory)
;;                 "node_modules"))
;;          (flow (and root
;;                       (expand-file-name "node_modules/.bin/flow"
;;                                         root))))
;;     (when (and flow (file-executable-p flow))
;;       (setq-local lsp-clients-flow-server flow))))

;; ;; (defun my/web-mode-on-tsx ()
;; ;;   "Enable tide-mode only .tsx file."
;; ;;   (message "aaaaaaaaaaaaaaaa")
;; ;;   (when (string-equal "tsx" (file-name-extension buffer-file-name))
;; ;;     (message "bbbbbbbbbbbbbbbb")
;; ;;     (flycheck-add-next-checker 'lsp 'javascript-eslint)
;; ;;     ))

;; (use-package lsp-mode
;;   :ensure t
;;   ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
;;   :init (setq lsp-keymap-prefix "s-l")
;;   :hook ((lsp-mode . lsp-enable-which-key-integration)
;;          (go-mode . lsp)
;;          (typescript-mode . lsp)
;;          (yaml-mode . lsp)
;;          (web-mode . lsp))
;;   ;; :config
;;   ;; ;; lsp checker が後にきてほしい
;;   ;; (add-to-list 'flycheck-checkers 'lsp)
;;   ;; (flycheck-add-next-checker 'javascript-eslint 'lsp)
;;   :config
;;   (flycheck-add-next-checker 'lsp 'javascript-eslint)
;;   ;; :custom
;;   ;; (lsp-diagnostic-package ":none")
;;   :commands lsp)

;; ;; (add-hook 'web-mode-hook 'my/use-flow-from-node-modules)

;; (use-package lsp-ui
;;   :ensure t
;;   :commands lsp-ui-mode)
;; (use-package company-lsp
;;   :ensure t
;;   :commands company-lsp)
;; ;; if you are helm user
;; ;; (use-package helm-lsp
;; ;;   :ensure t
;; ;;   :commands helm-lsp-workspace-symbol)
;; ;; optionally if you want to use debugger
;; ;; (use-package dap-mode)
;; ;; (use-package dap-LANGUAGE) to load the dap adapter for your language
