(setq ring-bell-function 'ignore)

(global-set-key (kbd "C-x p o") 'projectile-find-file)
;; (global-set-key (kbd "C-x p g") 'projectile-ripgrep)
(global-set-key (kbd "C-x p g") 'rg-project)

(setq frame-title-format `("%b %f"))

(show-paren-mode t)
;; (global-hl-line-mode t)
(which-function-mode t)
(add-to-list 'auto-mode-alist '("\\.T\\'" . c++-mode))
(setq find-program "C:\\msys64\\usr\\bin\\find.exe")
(setq grep-program "C:\\msys64\\usr\\bin\\grep.exe")

(setq-default c-basic-offset 4
              tab-width 4
              indent-tabs-mode t
			  c-default-style "k&r")

(defun flip-shade ()
   "Flip lightness shade."
   (interactive)
   (invert-face 'default)
   (invert-face 'hl-line))

(defun remove-newlines-in-region ()
  "Removes all newlines in the region."
  (interactive)
  (save-restriction
    (narrow-to-region (point) (mark))
    (goto-char (point-min))
    (while (search-forward "\n" nil t) (replace-match " & " nil t))))

(defun newline-to-list ()
  "Removes all newlines in the region."
  (interactive)
  (save-restriction
    (narrow-to-region (point) (mark))
    (goto-char (point-min))
    (while (search-forward "\n" nil t) (replace-match "\",\n" nil t))))

(defun dos2unix ()
  "replace \ -> /."
  (interactive)
  (save-restriction
    (narrow-to-region (point) (mark))
    (goto-char (point-min))
    (while (search-forward "\\" nil t) (replace-match "\/" nil t))))

(defun unix2dos ()
  "replace / -> \."
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

;; ============================================================================
;; packages
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
