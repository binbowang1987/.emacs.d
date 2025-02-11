;; from https://github.com/daviwil/emacs-from-scratch/blob/master/show-notes/Emacs-06.org

(use-package org
  :bind
  (("C-c l" . org-store-link)
   ("C-c a" . org-agenda))
  :hook
  (org-mode . (lambda () (org-indent-mode 1)))
  :config
  (setq org-ellipsis " ▶"
        org-hide-emphasis-markers t
        org-directory "/Users/binbowang/Library/CloudStorage/OneDrive-个人/org"
        org-agenda-files '("./gtd/tasks.org"
                           "./gtd/journal.org"
                           ;; "c:/Users/hua'wei/Nutstore/1/org/我的坚果云/org.learn"
                           )
        org-log-done 'time
        org-agenda-start-with-log-mode t
        org-log-into-drawer t
        org-file-apps '(("\\.docx\\'" . default)
                        ("\\.pdf\\'" . default)
                        (auto-mode . emacs))
        org-todo-keywords '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!)")
                            (sequence "BACKLOG(b)" "PLAN(p)" "READY(r)" "ACTIVE(a)" "REVIEW(v)" "WAIT(w@/!)" "HOLD(h)" "|" "COMPLETED(c)" "CANC(k@)"))))

(setq org-refile-targets '((org-agenda-files :maxlevel . 3)
                           ("./gtd/gtd.org" :maxlevel . 3)))

(defun dw/read-file-as-string (path)
  (with-temp-buffer
    (insert-file-contents path)
    (buffer-string)))

(setq org-capture-templates
  `(("t" "Tasks / Projects")
    ("tt" "Task" entry (file+olp "./gtd/tasks.org" "Inbox")
     "* TODO %?\n  %U\n  %a\n  %i" :empty-lines 1)
    ("ts" "Clocked Entry Subtask" entry (clock)
     "* TODO %?\n  %U\n  %a\n  %i" :empty-lines 1)

    ("j" "Journal Entries")
    ;; ("jj" "Journal" entry (file+olp+datetree "/Users/binbowang/Library/CloudStorage/OneDrive-个人/org/journal.org")
    ("jj" "Journal" entry (file+olp+datetree "./gtd/journal.org")
     "\n* %<%I:%M %p> - Journal :journal:\n\n%?\n\n"
     ;; ,(dw/read-file-as-string "~/Notes/Templates/Daily.org")
     :clock-in :clock-resume
     :empty-lines 1)
    ("jm" "Meeting" entry (file+olp+datetree "~/Projects/Code/emacs-from-scratch/OrgFiles/Journal.org")
     "* %<%I:%M %p> - %a :meetings:\n\n%?\n\n"
     :clock-in :clock-resume
     :empty-lines 1)

    ;; ("w" "Workflows")
    ;; ("we" "Checking Email" entry (file+olp+datetree ,(dw/get-todays-journal-file-name))
    ;;      "* Checking Email :email:\n\n%?" :clock-in :clock-resume :empty-lines 1)

    ;; ("m" "Metrics Capture")
    ;; ("mw" "Weight" table-line (file+headline "~/Projects/Code/emacs-from-scratch/OrgFiles/Metrics.org" "Weight")
    ;;  "| %U | %^{Weight} | %^{Notes} |" :kill-buffer t)
  ))

(define-key global-map (kbd "C-c j")
  (lambda () (interactive) (org-capture nil "jj")))
(define-key global-map (kbd "C-c t")
  (lambda () (interactive) (org-capture nil "tt")))

(use-package org-bullets
  :init
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  :custom
  (org-bullets-bullet-list '(;;; Large
                             "◉"
                             "○"
                             "●"
                             "✿"
                             ;; ♥ ● ◇ ✚ ✜ ☯ ◆ ♠ ♣ ♦ ☢ ❀ ◆ ◖ ▶
                             ;;; Small
                             ;; ► • ★ ▸
                             )))

;; Make sure org-indent face is available
(require 'org-indent)

;; Ensure that anything that should be fixed-pitch in Org files appears that way
;; (set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
;; (set-face-attribute 'org-code nil   :inherit '(shadow fixed-pitch))
;; (set-face-attribute 'org-indent nil :inherit '(org-hide fixed-pitch))
;; (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
;; (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
;; (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
;; (set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch)


;; (require 'org-habit)
;; (add-to-list 'org-modules 'org-habit)
;; (setq org-habit-graph-column 60)


;; (let*
;;     ((variable-tuple (cond ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
;;                              ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
;;                              ((x-list-fonts "Verdana")         '(:font "Verdana"))
;;                              ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
;;                              (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
;;        (base-font-color     (face-foreground 'default nil 'default))
;;        (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

;;   (custom-theme-set-faces 'user
;;                           `(org-level-8 ((t (,@headline ,@variable-tuple))))
;;                           `(org-level-7 ((t (,@headline ,@variable-tuple))))
;;                           `(org-level-6 ((t (,@headline ,@variable-tuple))))
;;                           `(org-level-5 ((t (,@headline ,@variable-tuple))))
;;                           `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
;;                           `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.25))))
;;                           `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.5))))
;;                           `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.75))))
;;                           `(org-document-title ((t (,@headline ,@variable-tuple :height 1.5 :underline nil)))))
;;   )

;; org past image from clipboard
(use-package org-download)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; for windows, should use magick to paste image from clipboard
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (setq org-download-method (quote attach))
;; (setq org-download-screenshot-file "e:/3.jpg")
;; (setq org-download-screenshot-method "magick clipboard: %s")
;; (defun myorg-clipboard (&optional basename)
;;   "Capture the image from the clipboard and insert the resulting file."
;;   (interactive)
;;   (let ((org-download-screenshot-method
;;          (cl-case system-type
;;            ((windows-nt cygwin)
;;             (if (executable-find "magick")
;;                 "magick clipboard: xxxxxxxxxx.jpg"
;;               (user-error
;;                "Please install the \"magick\" program included in ImageMagick")))
;;            )))
;;     (org-download-screenshot basename)))

(provide 'setup-org)
