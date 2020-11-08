;; Emacs スタート画面を表示しない
(setq inhibit-startup-screen t)

;; メニューバーを表示しない
(menu-bar-mode 0)

;; ツールバーを表示しない
(tool-bar-mode 0)

;; C-z で suspend しない
(global-unset-key "\C-z")

;; ビープ音を鳴らさない
(setq ring-bell-function 'ignore)

;; インデントにタブを使わない
(setq-default indent-tabs-mode nil)

;; 起動時にスクリーン最大化
(set-frame-parameter nil 'fullscreen 'maximized)

;; 行番号表示
(global-display-line-numbers-mode t)

;; あらゆるヒストリを保存
(savehist-mode 1)

;; ファイル変更されたらバッファを自動更新する
(global-auto-revert-mode 1)

;; grep 開始時にバッファ保存を聞かない
(defvar grep-save-buffers nil)

;; emacs server を起動
(use-package server
  :config
  (unless (server-running-p)
    (server-start)))

;; X とクリップボード共有
;; https://apple.stackovernet.xyz/ja/q/25364#127082
(defun pbcopy ()
  (interactive)
  (call-process-region (point) (mark) "pbcopy")
  (setq deactivate-mark t))

(defun pbpaste ()
  (interactive)
  (call-process-region (point) (if mark-active (mark) (point)) "pbpaste" t t))

(defun pbcut ()
  (interactive)
  (pbcopy)
  (delete-region (region-beginning) (region-end)))

(global-set-key (kbd "C-c c") 'pbcopy)
(global-set-key (kbd "C-c v") 'pbpaste)
(global-set-key (kbd "C-c x") 'pbcut)

(use-package xclip
  :ensure t
  :config
  (xclip-mode)
  )

(show-paren-mode)
