;; キー入力効率化
(use-package smartrep
  :ensure t)

;; 一時バッファをポップアップウィンドウ化する
(use-package popwin
  :ensure t
  :config
  (popwin-mode 1))

;; isearch 時に return でリージョン選択
;; https://emacs.stackexchange.com/questions/31320/selecting-i-e-as-the-region-the-current-match-in-incremental-search
(defun isearch-exit-mark-match ()
  "Exit isearch and mark the current match."
  (interactive)
  (isearch-exit)
  (push-mark isearch-other-end)
  (activate-mark))
(define-key isearch-mode-map (kbd "<return>") #'isearch-exit-mark-match)

;; prefix キー後の操作をガイド
(use-package which-key
  :ensure t
  :config (which-key-mode))
