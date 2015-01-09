; package manager
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
        )
       load-path))

(require 'cl)
(defvar require-packages
  '(
    auto-complete
    js2-mode
    web-mode
    csv-mode
    coffee-mode
    haml-mode
    php-mode
    markdown-mode
    yaml-mode
    whitespace
    molokai-theme
    projectile
    projectile-rails
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

;;表示が乱れるのでmenuを非表示にする
(menu-bar-mode -1)

;; #hoge#を作らない
(setq-default make-backup-files nil)

;; ~を作らない
(setq-default delete-auto-save-files t)

;;file名補完でignore-case
(setq completion-ignore-case t)

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
(define-key global-map [?\M-¥] [?\M-\\])
;; for iTerm2
(define-key input-decode-map "\e[1;5A" [C-up])
(define-key input-decode-map "\e[1;5B" [C-down])
(define-key input-decode-map "\e[1;5C" [C-right])
(define-key input-decode-map "\e[1;5D" [C-left])
(define-key input-decode-map "\e[1;6A" [C-S-up])
(define-key input-decode-map "\e[1;6B" [C-S-down])
(define-key input-decode-map "\e[1;6C" [C-S-right])
(define-key input-decode-map "\e[1;6D" [C-S-left])
(define-key input-decode-map "\e[1;8A" [C-M-up])
(define-key input-decode-map "\e[1;8B" [C-M-down])
(define-key input-decode-map "\e[1;8C" [C-M-right])
(define-key input-decode-map "\e[1;8D" [C-M-left])
(define-key input-decode-map "\e[1;9A" [M-up])
(define-key input-decode-map "\e[1;9B" [M-down])
(define-key input-decode-map "\e[1;9C" [M-right])
(define-key input-decode-map "\e[1;9D" [M-left])
(define-key input-decode-map "\e[1;10A" [S-M-up])
(define-key input-decode-map "\e[1;10B" [S-M-down])
(define-key input-decode-map "\e[1;10C" [S-M-right])
(define-key input-decode-map "\e[1;10D" [S-M-left])

;; 現在の行をハイライトする
(defface hlline-face
  '(
    (((class color) (background dark))
     (:background "#303030"))
    (((class color) (background light))
     (:background  "#98FB98"))
    (t ()))
  "*Face used by hl-line.")
(setq hl-line-face 'hlline-face)
(global-hl-line-mode)

;; インクリメンタルに現在位置の単語をmarkする
(defun my-mark-current-word (&optional arg allow-extend)
  "Put point at beginning of current word, set mark at end."
  (interactive "p\np")
  (setq arg (if arg arg 1))
  (if (and allow-extend
           (or (and (eq last-command this-command) (mark t))
               (region-active-p)))
      (set-mark
       (save-excursion
         (when (< (mark) (point))
           (setq arg (- arg)))
         (goto-char (mark))
         (forward-word arg)
         (point)))
    (let ((wbounds (bounds-of-thing-at-point 'word)))
      (unless (consp wbounds)
          (error "No word at point"))
      (if (>= arg 0)
          (goto-char (car wbounds))
        (goto-char (cdr wbounds)))
      (push-mark (save-excursion
                   (forward-word arg)
                   (point)))
      (activate-mark))))
(global-set-key "\M-@" 'my-mark-current-word)

;; 同名ファイルのバッファ名の識別文字を変更する
(require 'uniquify)
;; ファイル名<ディレクトリ名>
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; auto complete
(require 'popup)
(require 'auto-complete)
(global-auto-complete-mode t)
(add-to-list 'ac-dictionary-directories "~/dict/")
;; 4文字目から補完する。
(setq ac-auto-start 4)
(setq ac-modes (append ac-modes (list 'ruby-mode 'web-mode)))

;; css-mode
(add-to-list 'auto-mode-alist '("\\.scss$" . css-mode))

;; hide-show minor用のキーバインド(Ctrl-\)
(require 'hideshow)
(global-set-key (kbd "C-\\") 'hs-toggle-hiding)
;; 検索で開かないようにする
(setq hs-isearch-open nil)

;; customize ruby-mode
(setq ruby-align-chained-calls t)
(setq ruby-deep-indent-paren-style nil)
(setq ruby-insert-encoding-magic-comment nil)
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("/Capfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("/Gemfile" . ruby-mode))

;; js2-mode
(require 'js2-mode)
;;(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx$" . js2-mode))
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
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))

;; coffee-mode
(defun coffee-custom ()
  "coffee-mode-hook"
  (and (set (make-local-variable 'tab-width) 2) ; tab幅を2に
       (set (make-local-variable 'coffee-tab-width) 2)) ; tab幅を2に
  )
(add-hook 'coffee-mode-hook
          '(lambda() (coffee-custom)))

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

;; ruby-mode
;; _ は空白扱いとする
(add-hook 'ruby-mode-hook
          (lambda () (modify-syntax-entry ?_ "w")))

;; projectile for rails project
(setq projectile-keymap-prefix (kbd "C-c C-p")) ;; set C-c C-p to projectile prefix
(require 'projectile)
(projectile-global-mode)
(require 'projectile-rails)
(add-hook 'projectile-mode-hook 'projectile-rails-on)


;; 幅を直す
(defun set-east-asian-ambiguous-width (width)
  (while (char-table-parent char-width-table)
    (setq char-width-table (char-table-parent char-width-table)))
  (let ((table (make-char-table nil)))
    (dolist (range
             '(#x00A1 #x00A4 (#x00A7 . #x00A8) #x00AA (#x00AD . #x00AE)
                      (#x00B0 . #x00B4) (#x00B6 . #x00BA) (#x00BC . #x00BF)
                      #x00C6 #x00D0 (#x00D7 . #x00D8) (#x00DE . #x00E1) #x00E6
                      (#x00E8 . #x00EA) (#x00EC . #x00ED) #x00F0
                      (#x00F2 . #x00F3) (#x00F7 . #x00FA) #x00FC #x00FE
                      #x0101 #x0111 #x0113 #x011B (#x0126 . #x0127) #x012B
                      (#x0131 . #x0133) #x0138 (#x013F . #x0142) #x0144
                      (#x0148 . #x014B) #x014D (#x0152 . #x0153)
                      (#x0166 . #x0167) #x016B #x01CE #x01D0 #x01D2 #x01D4
                      #x01D6 #x01D8 #x01DA #x01DC #x0251 #x0261 #x02C4 #x02C7
                      (#x02C9 . #x02CB) #x02CD #x02D0 (#x02D8 . #x02DB) #x02DD
                      #x02DF (#x0300 . #x036F) (#x0391 . #x03A9)
                      (#x03B1 . #x03C1) (#x03C3 . #x03C9) #x0401
                      (#x0410 . #x044F) #x0451 #x2010 (#x2013 . #x2016)
                      (#x2018 . #x2019) (#x201C . #x201D) (#x2020 . #x2022)
                      (#x2024 . #x2027) #x2030 (#x2032 . #x2033) #x2035 #x203B
                      #x203E #x2074 #x207F (#x2081 . #x2084) #x20AC #x2103
                      #x2105 #x2109 #x2113 #x2116 (#x2121 . #x2122) #x2126
                      #x212B (#x2153 . #x2154) (#x215B . #x215E)
                      (#x2160 . #x216B) (#x2170 . #x2179) (#x2190 . #x2199)
                      (#x21B8 . #x21B9) #x21D2 #x21D4 #x21E7 #x2200
                      (#x2202 . #x2203) (#x2207 . #x2208) #x220B #x220F #x2211
                      #x2215 #x221A (#x221D . #x2220) #x2223 #x2225
                      (#x2227 . #x222C) #x222E (#x2234 . #x2237)
                      (#x223C . #x223D) #x2248 #x224C #x2252 (#x2260 . #x2261)
                      (#x2264 . #x2267) (#x226A . #x226B) (#x226E . #x226F)
                      (#x2282 . #x2283) (#x2286 . #x2287) #x2295 #x2299 #x22A5
                      #x22BF #x2312 (#x2460 . #x24E9) (#x24EB . #x254B)
                      (#x2550 . #x2573) (#x2580 . #x258F) (#x2592 . #x2595)
                      (#x25A0 . #x25A1) (#x25A3 . #x25A9) (#x25B2 . #x25B3)
                      (#x25B6 . #x25B7) (#x25BC . #x25BD) (#x25C0 . #x25C1)
                      (#x25C6 . #x25C8) #x25CB (#x25CE . #x25D1)
                      (#x25E2 . #x25E5) #x25EF (#x2605 . #x2606) #x2609
                      (#x260E . #x260F) (#x2614 . #x2615) #x261C #x261E #x2640
                      #x2642 (#x2660 . #x2661) (#x2663 . #x2665)
                      (#x2667 . #x266A) (#x266C . #x266D) #x266F #x273D
                      (#x2776 . #x277F) (#xE000 . #xF8FF) (#xFE00 . #xFE0F)
                      #xFFFD
                      ))
      (set-char-table-range table range width))
    (optimize-char-table table)
    (set-char-table-parent table char-width-table)
    (setq char-width-table table)))
(set-east-asian-ambiguous-width 2)
