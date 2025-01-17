
;; (defun ll ()
;;   "linux env"
;;   (interactive)
;;   (dired "/plink:user@host:~"))

;; (defun ll ()
;;   "linux env"
;;   (interactive)
;;   (dired "/ssh:user@host:~"))

;; (defun nn ()
;;   "notes"
;;   (interactive)
;;   ;; (dired "~/Documents/notes")
;;   (find-file "~/Documents/notes/notes.md")
;;   (find-file-other-window "~/Documents/notes/wip.md"))

;; (defun dd ()
;;   "linux devenv"
;;   (interactive)
;;   (dired "/ssh:user@host:~/src"))

(setq default-input-method "MacOSX")
(setq mac-command-modifier 'meta
      mac-option-modifier nil
      mac-allow-anti-aliasing t
      mac-command-key-is-meta t)

;;; Stefan Monnier <foo at acm.org>. It is the opposite of fill-paragraph    
(defun unfill-paragraph (&optional region)
  "Takes a multi-line paragraph and makes it into a single line of text."
  (interactive (progn (barf-if-buffer-read-only) '(t)))
  (let ((fill-column (point-max))
        ;; This would override `fill-column' if it's an integer.
        (emacs-lisp-docstring-fill-column t))
    (fill-paragraph nil region)))

;; Handy key definition
(define-key global-map "\M-Q" 'unfill-paragraph)

(defun unfill-region (beg end)
  "Unfill the region, joining text paragraphs into a single
    logical line.  This is useful, e.g., for use with
    `visual-line-mode'."
  (interactive "*r")
  (let ((fill-column (point-max)))
    (fill-region beg end)))
;; Handy key definition
(define-key global-map "\C-\M-Q" 'unfill-region)

(global-font-lock-mode -1)
(global-display-line-numbers-mode)
(which-function-mode)
(setq-default c-basic-offset 2
              tab-width 2
              indent-tabs-mode nil
							c-default-style "bsd")
;; (setq-default c-basic-offset 4
;;               tab-width 4
;;               indent-tabs-mode nil
;; 			  c-default-style "k&r")

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(magit)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "JetBrains Mono NL" :foundry "nil" :slant normal :weight regular :height 160 :width normal)))))
