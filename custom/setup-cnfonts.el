(use-package cnfonts
  :init
  (cnfonts-mode 1))
;; 让 cnfonts 在 Emacs 启动时自动生效。

;; 添加两个字号增大缩小的快捷键
;; (define-key cnfonts-mode-map (kbd "C--") #'cnfonts-decrease-fontsize)
;; (define-key cnfonts-mode-map (kbd "C-=") #'cnfonts-increase-fontsize)

;; (add-hook 'after-make-frame-functions 'cnfonts-mode)


(provide 'setup-cnfonts)
