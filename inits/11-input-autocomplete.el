;; Use company-mode experimentaly.
;; remove later.

;; (unless (require 'auto-complete nil t)
;;   (package-install 'auto-complete))

;; (require 'auto-complete-config)
;; (ac-config-default)
;; (setq ac-use-fuzzy t)
;; (global-auto-complete-mode t)
;; (define-key ac-mode-map (kbd "<tab>") 'ac-start)
;; (define-key ac-completing-map (kbd "<tab>") 'auto-complete)
;; (define-key ac-completing-map (kbd "C-n") 'ac-next)
;; (define-key ac-completing-map (kbd "C-p") 'ac-previous)
;; (setq ac-auto-show-menu 0)

;; ;; Add ac-sources
;; (defun ac-web-mode-setup ()
;;   (add-to-list 'ac-sources 'ac-source-yasnippet)
;;   (add-to-list 'ac-sources 'ac-source-filename))
;; (add-hook 'web-mode-hook 'ac-web-mode-setup)

;; (defun ac-css-mode-setup ()
;;   (add-to-list 'ac-sources 'add-ac-source-yasnippet)
;;   (add-to-list 'ac-sources 'ac-source-filename))
;; (add-hook 'css-mode-hook 'ac-css-mode-setup)

;; (defun ac-coffee-mode-setup ()
;;   (add-to-list 'ac-sources 'ac-source-filename))
;; (add-hook 'coffee-mode-hook 'ac-coffee-mode-setup)

;; ;; 日本語入力時ac無効化
;; ;; http://d.hatena.ne.jp/IMAKADO/20090813/1250130343
;; (defadvice ac-word-candidates (after remove-word-contain-japanese activate)
;;   (let ((contain-japanese (lambda (s) (string-match (rx (category japanese)) s))))
;;     (setq ad-return-value
;;           (remove-if contain-japanese ad-return-value))))

(unless (require 'company nil t)
  (package-install 'company))

(global-company-mode)

;; https://qiita.com/syohex/items/8d21d7422f14e9b53b17
(define-key company-mode-map (kbd "<tab>") 'company-complete)

;; C-n, C-pで補完候補を次/前の候補を選択
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-search-map (kbd "C-n") 'company-select-next)
(define-key company-search-map (kbd "C-p") 'company-select-previous)

;; C-sで絞り込む
(define-key company-active-map (kbd "C-s") 'company-filter-candidates)

;; TABで候補を設定
(define-key company-active-map (kbd "C-i") 'company-complete-selection)
