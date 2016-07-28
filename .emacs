;; Package management

(setq package-list '(nyan-mode
<<<<<<< HEAD
                     fic-ext-mode
                     sr-speedbar
                     auto-complete
                     solarized-theme
                     babel
                     graphviz-dot-mode
                     ob-ipython
                     markdown-mode
                     web-mode
                     winner-mode-enable
                     js2-mode))
=======
		     fic-ext-mode
		     sr-speedbar
		     auto-complete
		     solarized-theme
		     babel
		     ob-ipython
		     js2-mode
		     ac-js2
		     web-mode))
>>>>>>> origin/master

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")))

(package-initialize)

;; ((setq find-program "\"C:\\Program Files (x86)\\GnuWin32\\bin\\find.exe\"")
(makunbound 'find-program)

(when (fboundp 'winner-mode)
  (winner-mode 1))

;; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

;; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (ignore-errors
      (package-install package))))

;; js2-mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js2-mode-hook 'ac-js2-mode)

(hideshowvis-enable)

<<<<<<< HEAD
;; (server-start)

=======
>>>>>>> origin/master
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

(autoload 'hideshowvis-enable "hideshowvis" "Highlight foldable regions")
(autoload 'hideshowvis-minor-mode
  "hideshowvis"
  "Will indicate regions foldable with hideshow in the fringe."
  'interactive)

(dolist (hook (list 'emacs-lisp-mode-hook
                    'c++-mode-hook
                    'python-mode-hook))
  (add-hook hook 'hideshowvis-enable))

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

(add-to-list 'auto-mode-alist '("\\.hkShaderTemplate\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.hkShaderImport\\'" . glsl-mode))

;; auto-complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")

(ac-config-default)

;; web-mode
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(setq web-mode-enable-current-element-highlight t)
(setq web-mode-ac-sources-alist
      '(("css" . (ac-source-css-property))
        ("html" . (ac-source-words-in-buffer ac-source-abbrev))))


;; js2

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;; (add-hook 'js2-mode-hook 'ac-js2-mode)

;; (elpy-enable)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
<<<<<<< HEAD
 '(auto-save-file-name-transforms nil)
 '(c-default-style
   (quote
    ((java-mode . "java")
     (awk-mode . "awk")
     (other . "k&r"))))
=======
>>>>>>> origin/master
 '(column-number-mode t)
 '(compilation-message-face (quote default))
 '(custom-enabled-themes (quote (solarized-dark)))
 '(custom-safe-themes
   (quote
<<<<<<< HEAD
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(ediff-diff-options "--binary -w")
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(fic-highlighted-words (quote ("FIXME" "TODO" "BUG" "REDFLAG" "XXX")))
=======
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(ediff-diff-options "--binary -w")
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
>>>>>>> origin/master
 '(fringe-mode nil nil (fringe))
 '(ido-mode (quote both) nil (ido))
 '(indent-tabs-mode nil)
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
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tab-stop-list (quote (4 8 12)))
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(visible-bell t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
