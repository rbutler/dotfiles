;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
;; Speed up emacs
(setq redisplay-dont-pause t)

;; wrap lines
(setq-default truncate-lines nil)
(map! :leader :desc "Treemacs" "z" #'treemacs)
(after! org
  (setq org-todo-keywords
                '((sequence "TODO(t)" "ACTIVE(a)" "|" "DONE(d)")
                  (sequence "[ ](T)" "[-](p)" "[?](m)" "|" "[X](D)")
                  )))
(setq global-visual-fill-column-mode t)

(setq sp-autoinsert-pair nil)

;;(load-theme 'doom-one-light t)
(load-theme 'doom-solarized-light t)

(setq doom-font (font-spec :family "Consolas" :size 13)
      ;doom-variable-pitch-font (font-spec :family "Noto Sans" :size 13)
      doom-variable-pitch-font (font-spec :family "Arial" :size 13)
      )
(defun my-go-mode-hook ()
  (add-hook 'before-save-hook 'gofmt)
  (map! :leader :desc "godef-jump" "m" "j" #'godef-jump)
  )
;; (add-hook 'go-mode-hook 'my-go-mode-hook)

(defun arrayify (start end quote)
    "Turn strings on newlines into a QUOTEd, comma-separated one-liner."
    (interactive "r\nMQuote: ")
    (let ((insertion
           (mapconcat
            (lambda (x) (format "%s%s%s" quote x quote))
            (split-string (buffer-substring start end)) ", ")))
      (delete-region start end)
      (insert insertion)))

(remove-hook 'org-mode-hook #'auto-fill-mode)
(remove-hook 'text-mode-hook #'auto-fill-mode)
(add-hook 'message-mode-hook #'word-wrap-mode)
