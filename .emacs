;; Package management

(setq package-list '(nyan-mode
		     fic-ext-mode
		     sr-speedbar
		     auto-complete
		     solarized-theme
		     babel
		     graphviz-dot-mode
		     ob-ipython
		     js2-mode
		     ac-js2
		     web-mode))

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")))

(package-initialize)

; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (ignore-errors
      (package-install package))))

;; js2-mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js2-mode-hook 'ac-js2-mode)

(server-start)

(add-to-list 'load-path "~/.emacs.d/elisp")

;; web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((dot . t)))

(setq org-src-fontify-natively t)
(setq org-html-validation-link nil)

(setq inferior-lisp-program "sbcl.exe")
(setq slime-contribs '(slime-fancy))

(require 'nyan-mode)
(nyan-mode)

(require 'fic-ext-mode)

(require 'sr-speedbar)
;; (global-set-key (kbd "s-z") 'sr-speedbar-toggle)

(add-to-list 'hs-special-modes-alist
             '(nxml-mode
               "<!--\\|<[^/>]*[^/]>"
               "-->\\|</[^/>]*[^/]>"
               "<!--"
               nxml-forward-element
               nil))

(add-hook 'nxml-mode-hook 'hs-minor-mode)

;; (require 'highlight-indentation)

;; (autoload 'hideshowvis-enable "hideshowvis" "Highlight foldable regions")
;; (autoload 'hideshowvis-minor-mode
;;   "hideshowvis"
;;   "Will indicate regions foldable with hideshow in the fringe."
;;   'interactive)
;; (dolist (hook (list 'emacs-lisp-mode-hook
;;                     'c++-mode-hook
;;                     'python-mode-hook))
;;   (add-hook hook 'hideshowvis-enable))

(require 'zone)
(zone-when-idle 300)

;; scroll one line at a time (less "jumpy" than defaults)

;; (setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
;; (setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
;; (setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
;; (setq scroll-step 1) ;; keyboard scroll one line at a time

;; hlsl
(autoload 'hlsl-mode "hlsl-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.fx\\'" . hlsl-mode))
(add-to-list 'auto-mode-alist '("\\.hlsl\\'" . hlsl-mode))
(add-to-list 'auto-mode-alist '("\\.gs\\'" . hlsl-mode))
(add-to-list 'auto-mode-alist '("\\.ps\\'" . hlsl-mode))
(add-to-list 'auto-mode-alist '("\\.vs\\'" . hlsl-mode))
(add-to-list 'auto-mode-alist '("\\.sh\\'" . hlsl-mode))

;; auto-complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

;; (elpy-enable)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes (quote (solarized-dark)))
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(ediff-diff-options "--binary -w")
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(fringe-mode nil nil (fringe))
 '(ido-mode (quote both) nil (ido))
 '(inhibit-startup-screen t)
 '(jedi:server-command
   (quote
    ("mayapy" "c:\\Users\\pinkb\\AppData\\Roaming\\.emacs.d\\elpa\\jedi-0.1.2\\jediepcserver.py")))
 '(magit-diff-use-overlays nil)
 '(nyan-animate-nyancat t)
 '(nyan-wavy-trail t)
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(python-shell-interpreter "mayapy.exe")
 '(save-place t nil (saveplace))
 '(scroll-bar-mode (quote right))
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(visible-bell t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "outline" :slant normal :weight normal :height 98 :width normal)))))
