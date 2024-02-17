(use-package pyvenv
  :init
  (pyvenv-activate "~/.local/venv"))

(use-package elpy
  :init
  (setq elpy-rpc-python-command "python3")
  (setq python-shell-exec-path '("/usr/bin/python3"))
  (elpy-enable))

(add-to-list 'process-coding-system-alist '("python" . (utf-8 . utf-8)))

(provide 'setup-python)
