(unless (require 'robe nil t)
  (package-install 'robe))

(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'robe-mode-hook
  '(lambda ()
     (ac-robe-setup)
     (add-to-list 'ac-source-robe '(requires . -1))))
