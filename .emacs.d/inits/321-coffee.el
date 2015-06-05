
;; coffee-mode
(defun coffee-custom ()
  "coffee-mode-hook"
  (and (set (make-local-variable 'tab-width) 2) ; tab幅を2に
       (set (make-local-variable 'coffee-tab-width) 2)) ; tab幅を2に
  )
(add-hook 'coffee-mode-hook
          '(lambda() (coffee-custom)))
(add-to-list 'auto-mode-alist '("\\.coffee.erb\\'" . coffee-mode))
