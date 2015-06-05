;; haml-mode
(add-hook 'haml-mode-hook
          (lambda ()
            (append ac-modes (list 'haml-mode))))
