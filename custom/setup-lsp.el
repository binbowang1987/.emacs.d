(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-x x")
  (setq read-process-output-max (* 3 1024 1024));; 3MiB
  (setq lsp-eldoc-hook nil) ;; disable eldoc hook
  (setq lsp-clangd-binary-path "~/opt/llvm-13/bin/clangd")
  (setq lsp-auto-guess-root t)
  (setq lsp-completion-provider t)
  (setq lsp-enable-indentation nil)
  (setq lsp-enable-on-type-formatting nil)
  (setq lsp-file-watch-threshold 500000)
  (setq lsp-prefer-capf t)
  ;; (setq lsp-prefer-flymake nil)

  ;; :config
  ;;(define-key lsp-mode-map (kbd "C-x x") lsp-command-map)
  )

;; lsp-ui-doc
(use-package lsp-ui
  :init
  (setq lsp-ui-doc-show-with-cursor t)
  (setq lsp-ui-doc-posotion 'bottom)
  (setq lsp-ui-doc-alignment 'window))

;; c++ lsp server
(setq lsp-disabled-clients '(ccls))

(defun lsp:enable()
  (condition-case nil
      (lsp)
    (user-error nil)))

(defun lsp-enable-cpp()
  "enable auto start lsp-mode for cpp"
  (interactive)
  (add-hook 'c-mode-hook 'lsp:enable)
  (add-hook 'c++-mode-hook 'lsp:enable))


(defun lsp-disable-cpp()
  "disable auto start lsp-mode for cpp"
  (interactive)
  (remove-hook 'c-mode-hook 'lsp:enable)
  (remove-hook 'c++-mode-hook 'lsp:enable))

(use-package helm-lsp)

; (use-package lsp-dart)

(provide 'setup-lsp)
