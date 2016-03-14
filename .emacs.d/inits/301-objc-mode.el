(add-hook 'objc-mode-hook
          '(lambda()
             (setq c-basic-offset 4)
             (setq tab-width 4)
             (setq indent-tabs-mode nil)
             (c-set-offset 'case-label '+)
             (auto-complete-mode)
             ))

;; .hファイルもobjc-modeで開くけるようにする
(add-to-list 'magic-mode-alist
             `(,(lambda ()
                  (and (string= (file-name-extension buffer-file-name) "h")
                       (re-search-forward "@\\<interface\\>"
                                          magic-mode-regexp-match-limit t)))
               . objc-mode))
