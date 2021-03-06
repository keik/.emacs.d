;;; Code:
(defvar lsp-clients-flow-server)
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

(defvar flycheck-checker)
(defvar flycheck-checkers)
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
  ;; lsp-diagnostics-mode 適用時は lsp チェッカーが manually select された状態になるが、
  ;; 言語向け lint checker を flycheck-chckers 優先度順で自動適用したいので解除する。
  (lsp-diagnostics-mode . (lambda () (setq-local flycheck-checker nil)))
  :config
  ;; flycheck-checkers 内で lsp の位置をを最後尾に移動する。
  ;; checker の auto select は flycheck-checkers の定義順に行われるが、
  ;; lsp はあらゆる言語で選択されうるために next checker を一意に指定しにくかったり、動作が重かったりもするので、
  ;; まずは mode に適した軽量な checker を選択し、それの next checker として lsp を設定する。
  (lsp-diagnostics-mode)
  (setq flycheck-checkers (delete 'lsp flycheck-checkers))
  (add-to-list 'flycheck-checkers 'lsp t)
  (flycheck-add-next-checker 'javascript-eslint 'lsp)
  :commands lsp)

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)
