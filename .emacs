;; package manager
(require 'package)
(setq package-user-dir (expand-file-name "~/.emacs.d/packages"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;;自分用のロードパスの設定
(setq load-path
      (append
       (list
        (expand-file-name "~/.emacs.d/site-lisp")
        (expand-file-name "~/.emacs.d/auto-install")
        )
       load-path))

(require 'cl)
(defvar require-packages
  '(
    auto-complete
    js2-mode
    web-mode
    whitespace
    molokai-theme
    ))

(let ((not-installed (loop for x in require-packages
                           when (not (package-installed-p x))
                           collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
      (package-install pkg))))

;;自動でsymlinkをフォローする。
(setq vc-follow-symlinks t)

;;起動メッセージを表示しない
(setq inhibit-startup-message t)

;;行番号
(global-linum-mode t)
(setq linum-format "%3d  ")

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

;; [HOME] [END]の設定
(define-key global-map "\M-[1~" 'beginning-of-line)
(define-key global-map [select] 'end-of-line)
(define-key global-map [prior] 'scroll-down-command)
(define-key global-map [next] 'scroll-up-command)
(define-key global-map [home] 'beginning-of-line)
(define-key global-map [end] 'end-of-line)

;; auto install
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/auto-install/")
;;(auto-install-update-emacswiki-package-name t)

;; auto complete
(require 'auto-complete)
(global-auto-complete-mode t)
;; 4文字目から補完する。
(setq ac-auto-start 4)
(setq ac-modes (append ac-modes (list 'ruby-mode 'web-mode)))

;; hide-show minor用のキーバインド(Ctrl-\)
(global-set-key (kbd "C-\\") 'hs-toggle-hiding)
;; 検索で開かないようにする
(setq hs-isearch-open nil)

;; customize ruby-mode
(setq ruby-deep-indent-paren-style nil)
(setq ruby-insert-encoding-magic-comment nil)

;; js2-mode
(require 'js2-mode)
;;(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-hook 'js2-mode-hook '(lambda ()
    (setq js2-basic-offset 2)
    (hs-minor-mode 1)))

;; web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

;; color-theme molokai
(require 'molokai-theme)

;; whitespace mode
;; 空白文字に色を付ける
(require 'whitespace)
;; space-markとtab-mark、それからspacesとtrailingを対象とする
(setq whitespace-style '(space-mark tab-mark face spaces trailing))
(setq whitespace-display-mappings
      '(
        ;; (space-mark   ?\     [?\u00B7]     [?.]) ; space - centered dot
        (space-mark   ?\xA0  [?\u00A4]     [?_]) ; hard space - currency
        (space-mark   ?\x8A0 [?\x8A4]      [?_]) ; hard space - currency
        (space-mark   ?\x920 [?\x924]      [?_]) ; hard space - currency
        (space-mark   ?\xE20 [?\xE24]      [?_]) ; hard space - currency
        (space-mark   ?\xF20 [?\xF24]      [?_]) ; hard space - currency
        (space-mark ?\u3000 [?\u25a1] [?_ ?_]) ; full-width-space - square
        ;; NEWLINE is displayed using the face `whitespace-newline'
        ;; (newline-mark ?\n    [?$ ?\n])  ; eol - dollar sign
        ;; (newline-mark ?\n    [?\u21B5 ?\n] [?$ ?\n]); eol - downwards arrow
        ;; (newline-mark ?\n    [?\u00B6 ?\n] [?$ ?\n]); eol - pilcrow
        ;; (newline-mark ?\n    [?\x8AF ?\n]  [?$ ?\n]); eol - overscore
        ;; (newline-mark ?\n    [?\x8AC ?\n]  [?$ ?\n]); eol - negation
        ;; (newline-mark ?\n    [?\x8B0 ?\n]  [?$ ?\n]); eol - grade
        ;;
        ;; WARNING: the mapping below has a problem.
        ;; When a TAB occupies exactly one column, it will display the
        ;; character ?\xBB at that column followed by a TAB which goes to
        ;; the next TAB column.
        ;; If this is a problem for you, please, comment the line below.
        (tab-mark     ?\t    [?\u00BB ?\t] [?\\ ?\t]) ; tab - left quote mark
        ))
;; whitespace-spaceの定義を全角スペースにし、色をつけて目立たせる
(setq whitespace-space-regexp "\\(\u3000+\\)")
(set-face-foreground 'whitespace-space "cyan")
(set-face-background 'whitespace-space 'nil)
;; whitespace-trailingを色つきアンダーラインで目立たせる
(set-face-underline  'whitespace-trailing t)
(set-face-foreground 'whitespace-trailing "cyan")
(set-face-background 'whitespace-trailing 'nil)
;; whitespace-tab
(set-face-attribute 'whitespace-tab nil
                    :background "#232323"
                    :foreground "GreenYellow"
                    :weight 'bold)

(global-whitespace-mode 1)
