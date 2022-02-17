;;
(use-package yafolding
  :ensure t
  :hook
  (ruby-mode . yafolding-mode)
  :bind
  ("C-c f" . yafolding-toggle-element)
)
