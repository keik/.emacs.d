;; 複数カーソル操作
(use-package multiple-cursors
  :ensure t
  :bind
  ("C-c C-c C-s" . mc/mark-all-like-this)
  ("C-c C-c C-m" . mc/edit-lines))
