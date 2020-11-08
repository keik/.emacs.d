(use-package company
  :ensure t
  :demand t
  :bind (:map company-mode-map
              ("M-/" . company-complete)
              ;; デフォルトを使うので一旦なしで
              ;; :map company-active-map
              ;; ("C-n" . company-select-next)
              ;; ("C-p" . company-select-previous)
              ;; ("C-s" . company-filter-candidates)
              ;; :map company-search-map
              ;; ("C-n" . company-select-next)
              ;; ("C-p" . company-select-previous)
              )
  :config
  (global-company-mode)
  )

;; https://qiita.com/syohex/items/8d21d7422f14e9b53b17
;; (define-key company-mode-map (kbd "<tab>") 'company-complete)
;; C-n, C-pで補完候補を次/前の候補を選択
;; (define-key company-active-map (kbd "C-n") 'company-select-next)
;; (define-key company-active-map (kbd "C-p") 'company-select-previous)
;; (define-key company-search-map (kbd "C-n") 'company-select-next)
;; (define-key company-search-map (kbd "C-p") 'company-select-previous)
;; C-sで絞り込む
;; (define-key company-active-map (kbd "C-s") 'company-filter-candidates)
;; TABで候補を設定
;; (define-key company-active-map (kbd "C-i") 'company-complete-selection)

;; yasnippet 連携。一旦なしで
;; https://emacs.stackexchange.com/questions/10431/get-company-to-show-suggestions-for-yasnippet-names
;; Add yasnippet support for all company backends
;; https://github.com/syl20bnr/spacemacs/pull/179
;; (defvar company-mode/enable-yas t
;;   "Enable yasnippet for all backends.")
;; (defun company-mode/backend-with-yas (backend)
;;   (if (or (not company-mode/enable-yas) (and (listp backend) (member 'company-yasnippet backend)))
;;       backend
;;     (append (if (consp backend) backend (list backend))
;;             '(:with company-yasnippet))))
;; (setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))
