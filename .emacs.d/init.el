;; ~/.emacs.d/site-lisp 以下全部読み込み

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(let ((default-directory (expand-file-name "~/.emacs.d/site-lisp")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))

(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(setq init-loader-byte-compile t) ;; inits/以下を自動でbyte-compile する
(init-loader-load "~/.emacs.d/inits")
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (terraform-mode yaml-mode web-mode wakatime-mode w3m textile-mode swift3-mode scss-mode sass-mode projectile-rails powerline php-mode nyan-mode molokai-theme markdown-mode less-css-mode js2-mode graphviz-dot-mode go-mode el-get csv-mode coffee-mode ac-etags)))
 '(wakatime-api-key "035f756d-eeba-4fc5-806e-0b84325d45eb")
 '(wakatime-cli-path "~/wakatime/wakatime/cli.py"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
