(setq inhibit-startup-message t) 

(add-to-list 'load-path "~/.emacs.d/lisp")

; to load path
(add-to-list 'load-path "~/.emacs.d/groovy-emacs-mode")


; go-eldoc.el

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)
(package-refresh-contents)

(require 'go-eldoc) ;; Don't need to require, if you install by package.el



;;; turn on syntax highlighting
(global-font-lock-mode 1)

;;; use groovy-mode when file ends in .groovy or has #!/bin/groovy at start
(autoload 'groovy-mode "groovy-mode" "Major mode for editing Groovy code." t)
(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))

;;; make Groovy mode electric by default.
(add-hook 'groovy-mode-hook
          '(lambda ()
             (require 'groovy-electric)
             (groovy-electric-mode)))

;
;(require 'color-theme)
;(setq color-theme-is-global t)
;(color-theme-robin-hood)


; handlebars
(add-to-list 'load-path "~/.emacs.d/vendor/")
;(require 'handlebars-mode)

; golang
(add-to-list 'load-path "~/golang/go/misc/emacs/")
(require 'go-mode-load)
(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))
(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-c i") 'go-goto-imports)))
(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd \"M-.\") 'godef-jump)))

;(add-hook 'go-mode-hook auto-complete-mode)


(add-hook 'go-mode-hook 'go-eldoc-setup)


;; web-mode.el http://web-mode.org/

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
