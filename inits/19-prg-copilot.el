;;; 19-prg-copilot.el --- Configuration of copilot.
;;; Commentary:
;;; Code:
;; (unless (package-installed-p 'quelpa)
;;   (with-temp-buffer
;;     (url-insert-file-contents "https://raw.githubusercontent.com/quelpa/quelpa/master/quelpa.el")
;;     (eval-buffer)
;;     ;; (quelpa-self-upgrade)
;;     ))
;; (quelpa
;;  '(quelpa-use-package
;;    :fetcher git
;;    :url "https://github.com/quelpa/quelpa-use-package.git"))
;; (require 'quelpa-use-package)
;; (use-package copilot
;;   :quelpa (copilot :fetcher github
;;                    :repo "zerolfx/copilot.el"
;;                    :branch "main"
;;                    :files ("dist" "*.el")))
;; (add-to-list 'load-path "~/.emacs.d/quelpa/build/copilot/copilot.el")
;; (require 'copilot)
;; (define-key prog-mode-map (kbd "C-c TAB") #'copilot-complete)
;; (define-key copilot-completion-map (kbd "M-n") #'copilot-next-completion)
;; (define-key copilot-completion-map (kbd "M-p") #'copilot-previous-completion)
;; (define-key copilot-completion-map (kbd "C-g") #'copilot-clear-overlay)
;; (define-key copilot-completion-map (kbd "TAB") #'copilot-accept-completion)
;; (define-key copilot-completion-map (kbd "RET") #'copilot-accept-completion)
