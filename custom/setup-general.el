(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(setq scroll-bar-mode nil)
(set-scroll-bar-mode nil)

(setq gc-cons-threshold 100000000)
(setq inhibit-startup-message t)

(defalias 'yes-or-no-p 'y-or-n-p)

;; show unncessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook
          (lambda () (interactive)
            (setq show-trailing-whitespace 1)))

;; use space to indent by default
(setq-default indent-tabs-mode nil)

;; set appearance of a tab that is represented by 4 spaces
(setq-default tab-width 4)

;; Compilation
(global-set-key (kbd "<f5>") (lambda ()
                               (interactive)
                               (setq-local compilation-read-command nil)
                               (call-interactively 'compile)))

;; setup GDB
(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t

 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t
 )

;; company
(use-package company
  :init
  (global-company-mode 1)
  (setq company-idle-delay 0.1)
  (setq company-minimum-prefix-length 2)
  (setq company-auto-commit nil) ;;do not complelte when input SPC
  ;;(delete 'company-semantic company-backends)
  )
;; (define-key c-mode-map  [(control tab)] 'company-complete)
;; (define-key c++-mode-map  [(control tab)] 'company-complete)

;; disable company in shell mode
(defun disable-company()
  (company-mode -1))
(add-hook 'shell-mode-hook 'disable-company)

;; Package: projejctile
(use-package projectile
  :init
  (projectile-global-mode)
  (define-key projectile-mode-map (kbd "C-X p") 'projectile-command-map)
  :config
  (setq projectile-enable-caching t)
  (setq projectile-indexing-method 'native)
  )


;; Package zygospore
(use-package zygospore
  :bind (("C-x 1" . zygospore-toggle-delete-other-windows)
         ("RET" .   newline-and-indent)))

  ; automatically indent when press RET

;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)
;; (windmove-default-keybindings)

;; Package function-args
;; (use-package function-args
;;   :init
;;   (function-args-mode))
;; (fa-config-default)

;; smooth scrolling
(setq scroll-step 1)
(setq scroll-conservatively 10000)
(setq auto-window-vscroll nil)

(use-package ace-window
  :config
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)
        aw-scope 'frame)
  :bind
  (("M-o" . ace-window)))

(use-package treemacs
  :init
  (setq treemacs-read-string-input 'from-minibuffer)
  (setq treemacs-filewatch-mode -1)
  :bind
  (("M-0" . treemacs-select-window)))

(setq history-delete-duplicates t)

(use-package drag-stuff
  :init
  (setq drag-stuff-except-modes '(org-mode))
  :config
  (drag-stuff-global-mode 1)
  (drag-stuff-define-keys))

(use-package magit
  :bind
  (("C-x g" . 'magit-status))
  :init
  (setq magit-refresh-status-buffer nil)
  (setq magit-refresh-verbose t)
  )
(use-package cmake-mode)

;; (use-package all-the-icons)

(add-to-list 'auto-mode-alist '("\\.launch\\'" . xml-mode))

(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; half scroll
(global-set-key (kbd "C-v") 'View-scroll-half-page-forward)
(global-set-key (kbd "M-v") 'View-scroll-half-page-backward)

;; which-key
(use-package which-key
  :init
  (which-key-mode)
  :config
  (setq which-key-show-early-on-C-h t
        which-key-idle-delay 200
        which-key-idle-secondary-delay 0.05))


(provide 'setup-general)
