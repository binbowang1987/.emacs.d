;; company-c-headers
;;(require 'company-c-headers
;;  :init
;;  (add-to-list 'company-backends 'company-c-headers))

;; hs-minor-mode for folding source code
(add-hook 'c-mode-common-hook 'hs-minor-mode)

;; (use-package srecode)
;; (add-hook 'c-mode-hook 'semantic-mode)
;; (add-hook 'c++-mode-hook 'semantic-mode)
;; (add-hook 'semantic-mode-hook 'srecode-minor-mode)

(add-hook 'c-mode-hook 'superword-mode)
(add-hook 'c++-mode-hook 'superword-mode)

;; Available C style:
;; “gnu”: The default style for GNU projects
;; “k&r”: What Kernighan and Ritchie, the authors of C used in their book
;; “bsd”: What BSD developers use, aka “Allman style” after Eric Allman.
;; “whitesmith”: Popularized by the examples that came with Whitesmiths C, an early commercial C compiler.
;; “stroustrup”: What Stroustrup, the author of C++ used in his book
;; “ellemtel”: Popular C++ coding standards as defined by “Programming in C++, Rules and Recommendations,” Erik Nyquist and Mats Henricson, Ellemtel
;; “linux”: What the Linux developers use for kernel development
;; “python”: What Python developers use for extension modules
;; “java”: The default style for java-mode (see below)
;; “user”: When you want to define your own style
;; (defvaralias 'c-basic-offset 'tab-width)
(setq c-default-style "ellemtel"
      c-basic-offset 4
      )

(defconst my-cc-style
  '("ellemtel"
    (c-offsets-alist . ((innamespace . [0])))))

(c-add-style "my-cc-mode" my-cc-style)
(defun my-cc-style-setup ()
  (c-set-style "my-cc-mode")
  (setq c-basic-offset 2)
  (c-set-offset 'inlambda 0)
  (c-set-offset 'inextern-lang 0))

(defun my-cpp-style-setup ()
  (c-set-style "my-cc-mode")
  (setq c-basic-offset 4)
  (c-set-offset 'inlambda 0))

(add-hook 'c-mode-hook 'my-cc-style-setup)
(add-hook 'c++-mode-hook 'my-cpp-style-setup)

;; show function name in mode line
(which-function-mode 1)

;; (defadvice c-lineup-arglist (around my activate)
;;   "Improve indentation of continued C++11 lambda function opened as argument."
;;   (setq ad-return-value
;;         (if (and (equal major-mode 'c++-mode)
;;                  (ignore-errors
;;                    (save-excursion
;;                      (goto-char (c-langelem-pos langelem))
;;                      ;; Detect "[...](" or "[...]{". preceded by "," or "(",
;;                      ;;   and with unclosed brace.
;;                      (looking-at ".*[(,][ \t]*\\[[^]]*\\][ \t]*[({][^}]*$"))))
;;             0                           ; no additional indent
;;           ad-do-it)))                   ; default behavior

;; (use-package docstr
;;   :init
;;   (global-docstr-mode))

(provide 'setup-c)
