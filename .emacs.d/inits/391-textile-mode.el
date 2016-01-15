(require 'textile-mode)
(add-to-list 'auto-mode-alist '("\\.textile\\'" . textile-mode))
(add-to-list 'auto-mode-alist '("\\.redmine\\'" . textile-mode))

(add-hook 'textile-mode-hook
          (lambda ()
            (custom-set-faces
             '(textile-h1-face ((t (:foreground "#3ff" :background "#003" :weight bold))))
             '(textile-h2-face ((t (:foreground "#3ee" :background "#003" :weight bold))))
             '(textile-h3-face ((t (:foreground "#3dd" :background "#003" :weight bold))))
             '(textile-h4-face ((t (:foreground "#3cc" :background "#003" :weight bold))))
             '(textile-h5-face ((t (:foreground "#3bb" :background "#003" :weight bold))))
             '(textile-h6-face ((t (:foreground "#3aa" :background "#003" :weight bold))))
             '(textile-pre-face ((t (:foreground "#f00" :background "#333"))))
             '(textile-code-face ((t (:foreground "#f00" :background "#333"))))
             )
             (append ac-modes (list 'textile-mode))))
