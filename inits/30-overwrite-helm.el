(add-hook 'helm-after-initialize-hook
  (lambda ()
    (defun helm-buffers-sort-transformer (candidates _source)
      candidates)))
