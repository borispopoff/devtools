
;; (setq acme-theme-black-fg t)
;; (load-theme 'acme t)

(defun ll ()
  "linux env"
  (interactive)
  (dired "/plink:user@host:~"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(global-font-lock-mode nil)
 '(inhibit-startup-screen t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Iosevka Extended" :foundry "outline" :slant normal :weight regular :height 113 :width normal)))))

;; (add-to-list 'default-frame-alist '(height . 32))
;; (add-to-list 'default-frame-alist '(width . 80))
;; (set-face-background 'default "#ffffea")
;; (set-face-background 'tool-bar "#99e9e9")

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(add-to-list 'auto-mode-alist '("\\.T\\'" . c++-mode))

;; (setq find-program "C:\\msys64\\usr\\bin\\find.exe")
;; (setq grep-program "C:\\msys64\\usr\\bin\\grep.exe")
;; (setq diff-program "C:\\msys64\\usr\\bin\\diff.exe")
;; (setq diff3-program "C:\\msys64\\usr\\bin\\diff3.exe")

(setq-default c-basic-offset 4
              tab-width 4
              indent-tabs-mode t
			  c-default-style "k&r")

(defun dm ()
  "dark mode"
  (interactive)
  (set-background-color "black")
  (set-foreground-color "green"))

(defun lm ()
  "light mode"
  (interactive)
  (set-background-color "white")
  (set-foreground-color "black"))

(defun make-row ()
  "Removes all newlines in the region."
  (interactive)
  (save-restriction
    (narrow-to-region (point) (mark))
    (goto-char (point-min))
    (while (search-forward "\n" nil t) (replace-match " " nil t))))

(defun make-col ()
  "Removes all newlines in the region."
  (interactive)
  (save-restriction
    (narrow-to-region (point) (mark))
    (goto-char (point-min))
    (while (search-forward " " nil t) (replace-match "\n" nil t))))

(defun make-row-list ()
  "Removes all newlines in the region."
  (interactive)
  (save-restriction
    (narrow-to-region (point) (mark))
    (goto-char (point-min))
    (while (search-forward "\n" nil t) (replace-match "\",\n" nil t))))

(defun dos2unix ()
  "dos2unix for strings."
  (interactive)
  (save-restriction
    (narrow-to-region (point) (mark))
    (goto-char (point-min))
    (while (search-forward "\\" nil t) (replace-match "\/" nil t))))

(defun unix2dos ()
  "unix2dos for strings."
  (interactive)
  (save-restriction
    (narrow-to-region (point) (mark))
    (goto-char (point-min))
    (while (search-forward "\/" nil t) (replace-match "\\" nil t))))

(defun flip ()
   "Transpose two windows.  If more or less than two windows are visible, error."
   (interactive)
   (unless (= 2 (count-windows))
     (error "There are not 2 windows."))
   (let* ((windows (window-list))
          (w1 (car windows))
          (w2 (nth 1 windows))
          (w1b (window-buffer w1))
          (w2b (window-buffer w2)))
     (set-window-buffer w1 w2b)
     (set-window-buffer w2 w1b)))

