;; customize ruby-mode
(setq ruby-use-smie nil)
(setq ruby-align-chained-calls t)
(setq ruby-deep-indent-paren-style nil)
(setq ruby-insert-encoding-magic-comment nil)
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("/Capfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("/Gemfile" . ruby-mode))

;; ruby-mode
(add-hook 'ruby-mode-hook
          (lambda ()
            (modify-syntax-entry ?_ "w") ;; _ は空白扱いとする
            (append ac-modes (list 'ruby-mode))))
