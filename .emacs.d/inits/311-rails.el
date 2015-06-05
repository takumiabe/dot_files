(defmacro add-hook-fn (name &rest body)
  `(add-hook ,name #'(lambda() ,@body)))

;; projectile for rails project
(setq projectile-keymap-prefix (kbd "C-c C-p")) ;; set C-c C-p to projectile prefix
(require 'projectile)
(projectile-global-mode)

;; projectile-rails
(require 'projectile-rails)
(add-hook 'projectile-mode-hook 'projectile-rails-on)

;; define C-c r C-f to factory
(defun projectile-rails-find-factory ()
  (interactive)
  (projectile-rails-find-resource "factory: " '(("spec/factories/" "spec/factories/\\(.+\\)\\.rb$"))))
(add-hook-fn 'projectile-mode-hook
             (projectile-rails-on)
             (define-key projectile-mode-map (kbd "C-c r C-f") 'projectile-rails-find-factory)
             )
