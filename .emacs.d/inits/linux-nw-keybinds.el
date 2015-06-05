
;; [HOME] [END]の設定
(define-key global-map "\M-[1~" 'beginning-of-line)
(define-key global-map [select] 'end-of-line)
(define-key global-map [prior] 'scroll-down-command)
(define-key global-map [next] 'scroll-up-command)
(define-key global-map [home] 'beginning-of-line)
(define-key global-map [end] 'end-of-line)
