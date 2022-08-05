(ivy-mode)
(counsel-mode)

(global-set-key (kbd "C-x p o") 'projectile-find-file)
(global-set-key (kbd "C-x p g") 'projectile-ripgrep)
;; (global-set-key (kbd "C-x p g") 'rg-project)

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

;; ============================================================================
;; packages
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
