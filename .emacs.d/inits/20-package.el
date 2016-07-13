; package manager
(require 'package)
(setq package-user-dir (expand-file-name "~/.emacs.d/packages"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/")
             '("marmalade" . "http://marmalade-repo.org/packages/")
             )
(package-initialize)

(require 'cl)
(defvar require-packages
  '(
    auto-complete
    nyan-mode
    go-mode
    js2-mode
    less-css-mode
    web-mode
    csv-mode
    coffee-mode
    graphviz-dot-mode
    haml-mode
    php-mode
    scss-mode
    sass-mode
    markdown-mode
    yaml-mode
    whitespace
    molokai-theme
    projectile
    projectile-rails
    textile-mode
    ))

(let ((not-installed (loop for x in require-packages
                           when (not (package-installed-p x))
                           collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
      (package-install pkg))))
