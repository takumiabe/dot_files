;; css-mode
(setq css-indent-offset 2)


;; scss-mode
(require 'scss-mode)
(add-hook 'scss-mode-hook
          '(lambda()
             (modify-syntax-entry ?, " " css-mode-syntax-table)
             (setq scss-compile-at-save nil)))
