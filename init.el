(require 'package)
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize) ;; You might already have this line

(setq make-backup-files nil) ; stop creating backup~ files
;; stop creating lock files, files like .#notes.org
(setq create-lockfiles nil)


(setq auto-save-default nil) ; stop creating #autosave# files
;; config auto save file location
;; (defconst emacs-tmp-dir (expand-file-name (format "emacs%d" (user-uid)) temporary-file-directory))
;; (setq backup-directory-alist
;;       `((".*" . ,emacs-tmp-dir)))
;; (setq auto-save-file-name-transforms
;;       `((".*" ,emacs-tmp-dir t)))
;; (setq auto-save-list-file-prefix
;;       emacs-tmp-dir)

;; desktop-save-mode
(desktop-save-mode 1)
(view-mode 1)

;; Set Frame width/height
;; (setq default-frame-alist
;;       '((top . 497) (left . 1260) (width . 1336) (height . 1313)))

;; unit: characters
(defconst frame-default-top     500  "The 'top'  position property of a frame.")
(defconst frame-default-left    1300  "The 'left' position property of a frame.")
(defconst frame-default-height  50  "The default frame height.")
(defconst frame-default-width   100  "The default frame width.")

(add-to-list 'default-frame-alist (cons 'left   frame-default-left))
(add-to-list 'default-frame-alist (cons 'top    frame-default-top))
(add-to-list 'default-frame-alist (cons 'height frame-default-height))
(add-to-list 'default-frame-alist (cons 'width  frame-default-width))

(require 'docstr)
(global-docstr-mode t)
(setq docstr-key-support t)
(require 'docstr-c++)
(require 'docstr-c)
(require 'docstr-rust)

;;(add-to-list 'package-archives
;;             '("melpa" . "http://melpa.org/packages/") t)

(when (not package-archive-contents)
    (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; (set-face-attribute 'default nil :family "Consolas" :height 120)
(set-face-attribute 'default nil :height 140)

(add-to-list 'load-path "~/.emacs.d/custom")

;;load protobuf
(use-package protobuf-mode)

(use-package yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml'" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml'" . yaml-mode))

;;load theme
;; (load "~/.emacs.d/themes/zenburn-theme.el")
;; (load "~/.emacs.d/themes/dracula-theme.el")
;; (add-to-list 'load-path "~/.emacs.d/custom-theme-load-path/emacs-color-theme-solarized-master")
;; (load "~/.emacs.d/custom-theme-load-path/emacs-color-theme-solarized-master/solarized-theme.el")
;; (load-theme 'zenburn t)
;;(load-theme 'dracula t)
;;(load-theme 'solarized t)

(defun theme-light()
  "load light theme"
  (interactive)
  (disable-theme 'spacemacs-dark)
  (load-theme 'spacemacs-light t))

(defun theme-dark()
  "load dark theme"
  (interactive)
  (disable-theme 'spacemacs-light)
  (load-theme 'spacemacs-dark t))

(use-package spacemacs-theme
  :defer t
  ;; :init (load-theme 'spacemacs-light t))
  :init (load-theme 'spacemacs-dark t))

;; (use-package doom-themes
;;   :ensure t
;;   :config
;;   ;; Global settings (defaults)
;;   (theme-dark)

;;   ;; Enable flashing mode-line on errors
;;   (doom-themes-visual-bell-config)
;;   ;; Enable custom neotree theme (all-the-icons must be installed!)
;;   (doom-themes-neotree-config)
;;   ;; or for treemacs users
;;   (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
;;   (doom-themes-treemacs-config)
;;   ;; Corrects (and improves) org-mode's native fontification.
;;   (doom-themes-org-config))

;; (use-package modus-themes
;;   :init (load-theme 'modus-vivendi t))

(require 'setup-general)
;; (require 'setup-doom-modeline)
(require 'setup-helm)
(require 'setup-ivy-counsel)
;; (if (version< emacs-version "24.4")
;;     (require 'setup-ivy-counsel)
;;     (require 'setup-helm)
;;     (require 'setup-helm-gtags)
;;     )
;;(require 'setup-ggtags)
;; (require 'setup-cedet)
(require 'setup-editing)
(require 'setup-c)

;; configure lsp
;; (require 'setup-ccls)
(require 'setup-lsp)

(require 'setup-org)
(require 'setup-python)
(require 'setup-rust)
(require 'setup-dap)

(use-package qt-pro-mode)
(use-package all-the-icons)

(setq magit-refresh-status-buffer nil)
(setq magit-refresh-verbose t)

(use-package highlight-doxygen)
(highlight-doxygen-global-mode 1)
(global-hl-line-mode 1)

(use-package hl-todo)
(global-hl-todo-mode 1)

;; function-args
;; (require 'function-args)
;; (fa-config-default)
;; (define-key c-mode-map  [(tab)] 'company-complete)
;; (define-key c++-mode-map  [(tab)] 'company-complete)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(edit-indirect toml-mode go-mode json-mode which-key treemacs-magit dap-mode helm-lsp docstr lsp-treemacs lsp-ui lsp-mode hl-todo highlight-doxygen all-the-icons qt-pro-mode elpy pyvenv org-bullets iedit anzu ws-butler dtrt-indent clean-aindent-mode yasnippet undo-tree helm-swoop helm cmake-mode magit drag-stuff treemacs ace-window zygospore modus-themes protobuf-mode)))

;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(org-document-title ((t (:inherit default :weight bold :foreground "#bbc2cf" :font "Verdana" :height 1.5 :underline nil))))
;;  '(org-level-1 ((t (:inherit default :weight bold :foreground "#bbc2cf" :font "Verdana" :height 1.75))))
;;  '(org-level-2 ((t (:inherit default :weight bold :foreground "#bbc2cf" :font "Verdana" :height 1.5))))
;;  '(org-level-3 ((t (:inherit default :weight bold :foreground "#bbc2cf" :font "Verdana" :height 1.25))))
;;  '(org-level-4 ((t (:inherit default :weight bold :foreground "#bbc2cf" :font "Verdana" :height 1.1))))
;;  '(org-level-5 ((t (:inherit default :weight bold :foreground "#bbc2cf" :font "Verdana"))))
;;  '(org-level-6 ((t (:inherit default :weight bold :foreground "#bbc2cf" :font "Verdana"))))
;;  '(org-level-7 ((t (:inherit default :weight bold :foreground "#bbc2cf" :font "Verdana"))))
;;  '(org-level-8 ((t (:inherit default :weight bold :foreground "#bbc2cf" :font "Verdana")))))

;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(org-document-title ((t (:inherit default :weight bold :foreground "#bbc2cf" :family "Sans Serif" :height 1.5 :underline nil))))
;;  '(org-level-1 ((t (:inherit default :weight bold :foreground "#bbc2cf" :family "Sans Serif" :height 1.75))))
;;  '(org-level-2 ((t (:inherit default :weight bold :foreground "#bbc2cf" :family "Sans Serif" :height 1.5))))
;;  '(org-level-3 ((t (:inherit default :weight bold :foreground "#bbc2cf" :family "Sans Serif" :height 1.25))))
;;  '(org-level-4 ((t (:inherit default :weight bold :foreground "#bbc2cf" :family "Sans Serif" :height 1.1))))
;;  '(org-level-5 ((t (:inherit default :weight bold :foreground "#bbc2cf" :family "Sans Serif"))))
;;  '(org-level-6 ((t (:inherit default :weight bold :foreground "#bbc2cf" :family "Sans Serif"))))
;;  '(org-level-7 ((t (:inherit default :weight bold :foreground "#bbc2cf" :family "Sans Serif"))))
;;  '(org-level-8 ((t (:inherit default :weight bold :foreground "#bbc2cf" :family "Sans Serif")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
