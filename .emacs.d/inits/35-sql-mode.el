(setq-default sql-smie-indent-basic 2)
;;(require 'sql-mode)
(require 'sql-smie-mode)

;; (add-to-list 'auto-mode-alist '("\\.sql$" . sql-smie-mode))
;;(add-to-list 'auto-mode-alist '("\\.sql$" . sql-smie-mode))
(add-hook 'sql-mode-hook '(lambda()
                            (sql-smie-mode)
                            ))
