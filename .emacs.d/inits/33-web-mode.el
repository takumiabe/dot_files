(add-to-list 'ac-modes 'web-mode)

;; web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))

(add-hook 'web-mode-hook
          (lambda ()
            (setq web-mode-code-indent-offset
                  (cond
                   ((string-match "\.php$" (or (buffer-name) "")) 2)
                   ((string-match "\.erb$" (or (buffer-name) "")) 2)
                   (t 4)))
            (setq web-mode-markup-indent-offset 2)
            ))
