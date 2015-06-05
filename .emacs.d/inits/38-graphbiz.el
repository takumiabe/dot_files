;; graphviz mode
(require 'graphviz-dot-mode)
(add-hook 'graphviz-dot-mode-hook
          (lambda()
            (local-set-key [f5] "\C-x\C-s\C-cc\C-m")
            (setq graphviz-dot-auto-indent-on-newline nil)
            (setq graphviz-dot-auto-indent-on-semi nil)
            (setq graphviz-dot-indent-width 2)
            ))
