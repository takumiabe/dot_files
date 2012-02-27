;;自分用のロードパスの設定
(setq load-path
      (append
       (list
        (expand-file-name "~/.emacs.d/site-lisp")
        (expand-file-name "~/.emacs.d/auto-install")
        )
        load-path))

;;起動メッセージを表示しない
(setq inhibit-startup-message t)

;;行番号
;;(global-linum-mode t)

;; #hoge#を作らない
(setq-default make-backup-files nil)

;; ~を作らない
(setq-default delete-auto-save-files t)

;; インデントはspaceで
(setq-default indent-tabs-mode nil)

;;スクロール量の調整
(setq-default scroll-conservatively 35
              scroll-margin 0
              scroll-step 4)

;;日本語でUTF-8
(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(prefer-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8)

(global-font-lock-mode t)
(setq font-lock-support-mode 'jit-lock-mode)

;; [HOME] [END]の設定
;;(define-key global-map "\M-[1~" 'beginning-of-line)
;;(define-key global-map [select] 'end-of-line)

;; 色づけ
(global-font-lock-mode t)
(setq font-lock-support-mode 'jit-lock-mode)

;; js2-mode
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; auto install
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/auto-install/")
;;(auto-install-update-emacswiki-package-name t)

;; auto complete
(require 'auto-complete)
(global-auto-complete-mode t)

;; PHP mode(require 'php-mode)
(add-hook 'php-mode-hook '(lambda ()
    (setq c-basic-offset 4)
    (setq c-tab-width 4)
    (setq indent-tabs-mode nil)
    (setq tab-width 4)
    (setq-default tab-width 4)
    (c-set-offset 'substatement-open 0)
    (c-set-offset 'arglist-intro '+)
    (c-set-offset 'arglist-close 0)
) t)
(add-to-list 'auto-mode-alist '("\\.ctp$" . php-mode))

;; sql-mode(require 'sql-indent)
(add-hook 'sql-mode-hook
    (function (lambda ()
                (setq tab-width 2))))

;; mmm-mode
(add-to-list 'load-path "~/.emacs.d/plugins/mmm-mode")
;;(require 'mmm-mode)
(require 'mmm-auto)
(setq mmm-global-mode 'maybe)
(setq mmm-submode-decoration-level 0)
(set-face-background 'mmm-default-submode-face "#333333")

;; for html-erb
(mmm-add-group
 'fancy-html
 '((html-erb-mode
    :submode ruby-mode
    :match-face (("<%#" . mmm-comment-submode-face)
                 ("<%=" . mmm-output-submode-face)
                 ("<%"  . mmm-code-submode-face))
    :front "<%[#=]?"
    :back "%>"
    :insert ((?% erb-code       nil @ "<%" @ " " _ " " @ "%>" @)
             (?# erb-comment    nil @ "<%#" @ " " _ " " @ "%>" @)
             (?# erb-expression nil @ "<%=" @ " " _ " " @ "%>" @)))))

(add-to-list 'mmm-mode-ext-classes-alist '(html-mode nil fancy-html))

;; for html
(mmm-add-classes
 '((mmm-html-css-mode
    :submode css-mode
    :face mmm-code-submode-face
    :front "<style[^>]*>\\([^<]*<!--\\)?\n"
    :back "\\(\\s-*-->\\)?\n[ \t]*</style>"
    )
   (mmm-html-javascript-mode
    :submode js2-mode
    :face mmm-code-submode-face
    :front "<script[^>]*>\\([^<]*<!--\\)?\n"
    :back "</script>"
    )
   (mmm-php-sql-mode
    :submode sql-mode
    :face mmm-code-submode-face
    :front "<<<\\(SQL\\|EOT\\)$"
    :back "^~1"
    :save-matches 1
    )
   ))
(mmm-add-mode-ext-class 'html-mode nil 'mmm-html-css-mode)
(mmm-add-mode-ext-class 'html-mode nil 'mmm-html-javascript-mode)
(mmm-add-mode-ext-class 'php-mode nil 'mmm-php-sql-mode)
