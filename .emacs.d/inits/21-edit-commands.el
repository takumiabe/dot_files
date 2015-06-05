
;; auto complete
(require 'popup)
(require 'auto-complete)
(global-auto-complete-mode t)
(add-to-list 'ac-dictionary-directories "~/dict/")
;; 4文字目から補完する。
(setq ac-auto-start 4)


;; hide-show minor用のキーバインド(Ctrl-\)
(require 'hideshow)
(global-set-key (kbd "C-\\") 'hs-toggle-hiding)
;; 検索で開かないようにする
(setq hs-isearch-open nil)
