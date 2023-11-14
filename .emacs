
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; magic trick to get tramp working for me
(customize-set-variable 'tramp-syntax 'simplified)
;; in case ssh/scp is not available
;; (setq tramp-default-method "plink")

(setq visible-bell 1)
(setq ring-bell-function 'ignore)

(setq-default tab-width 4)
(setq-default indent-tabs-mode t)
(show-paren-mode t)
(which-function-mode t)
(add-to-list 'auto-mode-alist '("\\.T\\'" . c++-mode))

;; (setq find-program "C:\\msys64\\usr\\bin\\find.exe")
;; (setq grep-program "C:\\msys64\\usr\\bin\\grep.exe")
;; (setq diff-program "C:\\msys64\\usr\\bin\\diff.exe")
;; (setq diff3-program "C:\\msys64\\usr\\bin\\diff3.exe")

(setq-default c-basic-offset 4
              tab-width 4
              indent-tabs-mode t
			  c-default-style "k&r")

(defun ff ()
  "find file at point"
  (interactive)
  (find-file-at-point))

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

