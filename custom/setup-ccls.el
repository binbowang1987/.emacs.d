
;;load ccls
(require 'ccls)
(setq ccls-args (quote ("--log-file=/tmp/ccls.log -v=1" "--init={\"cache\":{\"directory\":\"/home/wangbinbo/.ccls-cache\"}}")))

;; (defun ccls:enable ()
;;   (condition-case nil
;;       (lsp)
;;     (user-error nil)))

;; (add-hook 'c-mode-hook 'ccls:enable)
;; (add-hook 'c++-mode-hook 'ccls:enable)

;; (require 'company-lsp)
;; (push 'company-lsp company-backends)

(provide 'setup-ccls)
