
;;自動でsymlinkをフォローする。
(setq vc-follow-symlinks t)

;;起動メッセージを表示しない
(setq inhibit-startup-message t)

;;行番号
(global-linum-mode nil)
(setq linum-format "%3d  ")

;;行・列番号
(line-number-mode t)
(column-number-mode t)

;;表示が乱れるのでmenuを非表示にする
(menu-bar-mode -1)

;; #hoge#を作らない
(setq make-backup-files nil)

;; ~を作らない
(setq delete-auto-save-files t)

;;file名補完でignore-case
(setq completion-ignore-case t)

;;スクロール量の調整
(setq-default scroll-conservatively 1
              scroll-margin 0
              scroll-step 4)
(setq-default next-screen-context-lines 10)

;; インデントはspaceで
(setq-default indent-tabs-mode nil)

;;日本語でUTF-8
(prefer-coding-system 'utf-8-unix)
(setq-default buffer-file-coding-system 'utf-8-unix)
