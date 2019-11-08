;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(map! :leader :desc "Treemacs" "z" #'treemacs)
(after! org
  (setq org-todo-keywords
                '((sequence "TODO(t)" "ACTIVE(a)" "|" "DONE(d)")
                  (sequence "[ ](T)" "[-](p)" "[?](m)" "|" "[X](D)")
                  )))
(setq global-visual-fill-column-mode t)

;;(load-theme 'doom-one-light t)
;; (load-theme 'doom-solarized-light t)

(setq doom-font (font-spec :family "Consolas" :size 13)
      doom-variable-pitch-font (font-spec :family "Noto Sans" :size 13))
