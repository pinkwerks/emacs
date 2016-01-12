(setq package-list '(nyan-mode
		     fic-ext-mode
		     sr-speedbar
		     auto-complete
		     solarized-theme))

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
    (package-install package)))

(server-start)
(add-to-list 'load-path "~/.emacs.d/elisp")
;; (add-to-list 'load-path "c:/users/pinkb/Documents/GitHub/nyan-mode")

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
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(column-number-mode t)
 '(custom-enabled-themes (quote (solarized-dark)))
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(desktop-save-mode t)
 '(ediff-diff-options "--binary -w")
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(fci-rule-color "#383838")
 '(fic-highlighted-words (quote ("FIXME" "TODO" "BUG" "REDFLAG" "XXX")))
 '(fringe-mode nil nil (fringe))
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(ido-mode (quote both) nil (ido))
 '(inhibit-startup-screen t)
 '(jedi:server-command
   (quote
    ("mayapy" "c:\\Users\\pinkb\\AppData\\Roaming\\.emacs.d\\elpa\\jedi-0.1.2\\jediepcserver.py")))
 '(nyan-animate-nyancat t)
 '(nyan-wavy-trail t)
 '(python-shell-interpreter "mayapy.exe")
 '(save-place t nil (saveplace))
 '(scroll-bar-mode (quote right))
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3")
 '(visible-bell t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "outline" :slant normal :weight normal :height 98 :width normal)))))
