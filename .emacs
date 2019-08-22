(require 'cask "~/.cask/cask.el")
(cask-initialize)

(setq-default abbrev-mode t)
(setq-default indent-tabs-mode nil)
(load "~/emacs/rc/init.el") ;; this is for git in magit to work

(setq exec-path
      (cons (concat (getenv "HOME") "/.local/bin") exec-path))

;;; Helpers ;;;
(load "~/Helpers/load-all.el")

;;; vi-mode-and-evil-fold ;;;
(load "~/emacs/rc/emacs-rc-evil.el")

;; add commonly used paths
(push "~/emacs/misc" load-path)
(push "~/projects/emacs-addons" load-path)
(push "~/emacs/programming" load-path)

;; load from .emacs.d/rc
(load "~/.emacs.d/rc/magit.el")
(load "~/elisp/se-sign-ru.el")
(load "~/emacs/rc/emacs-rc-custom.el")
(load "~/emacs/rc/emacs-rc-keybindings.el")
(load "~/emacs/rc/emacs-rc-mouse.el")
(load "~/emacs/rc/emacs-rc-full-screen.el")
(load "~/emacs/rc/emacs-rc-hideshow.el")

(push "~/elisp" load-path)
(load "prlfun.el")

(load "~/emacs/rc/emacs-rc-locale.el")
(load "~/emacs/rc/emacs-rc-tramp.el")
(load "~/emacs/rc/emacs-rc-w3m.el")
(load "~/emacs/rc/emacs-rc-esc-term-clean.el")
(load "~/emacs/rc/emacs-rc-org-as-day-planner.el")
(load "~/emacs/rc/emacs-rc-easy-pg.el")

(put 'narrow-to-page 'disabled nil)

(load "~/emacs/make.el")
(load "~/emacs/rake.el")
(load "~/emacs/filemaker-mode.el")
(load "~/emacs/recap.el")
(load "~/Dropbox/beorg/init.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-time-mode t)
 '(ecb-options-version "2.40")
 '(flycheck-eslintrc ".eslintrc.js")
 '(indent-tabs-mode nil)
 '(js2-basic-offset 2)
 '(js2-bounce-indent-p t)
 '(org-agenda-custom-commands
   '(("d" todo "DELEGATED" nil)
     ("c" todo "DONE|DEFERRED|CANCELLED" nil)
     ("w" todo "WAITING" nil)
     ("W" agenda ""
      ((org-agenda-ndays 21)))
     ("A" agenda ""
      ((org-agenda-skip-function
        (lambda nil
          (org-agenda-skip-entry-if 'notregexp "\\=.*\\[#A\\]")))
       (org-agenda-ndays 1)
       (org-agenda-overriding-header "Today's Priority #A tasks: ")))
     ("u" alltodo ""
      ((org-agenda-skip-function
        (lambda nil
          (org-agenda-skip-entry-if 'scheduled 'deadline 'regexp "
]+>")))
       (org-agenda-overriding-header "Unscheduled TODO entries: ")))))
 '(org-agenda-files
   '(""))
 '(org-agenda-ndays 7)
 '(org-agenda-show-all-dates t)
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-start-on-weekday nil)
 '(org-deadline-warning-days 14)
 '(org-default-notes-file "")
 '(org-fast-tag-selection-single-key 'expert)
 '(org-remember-store-without-prompt t)
 '(org-remember-templates
   '((116 "* TODO %?
  %u" "~/Dropbox/org/foo.org" "Tasks")
     (110 "* %u %?" "" "Notes")))
 '(org-reverse-note-order t)
 '(package-selected-packages
   '(elpy anki-editor slime auctex auto-complete-auctex php-mode alert web-mode use-package smex smartparens slim-mode rspec-mode robe react-snippets projectile-rails prodigy popwin paredit pallet org-plus-contrib nyan-mode neotree multiple-cursors multi-term magit json-mode js2-mode idle-highlight-mode htmlize flycheck-cask feature-mode expand-region exec-path-from-shell drag-stuff bongo))
 '(remember-annotation-functions '(org-remember-annotation))
 '(remember-handler-functions '(org-remember-handler))
 '(safe-local-variable-values
   '((eval progn
           (add-to-list 'exec-path
                        (concat
                         (locate-dominating-file default-directory ".dir-locals.el")
                         "node_modules/.bin/")))))
 '(send-mail-function 'smtpmail-send-it)
 '(tool-bar-mode nil)
 '(w3m-antenna-sites
   '(("" "" nil)
     ("" "" nil))))
 '(web-mode-code-indent-offset 2)
 '(web-mode-css-indent-offset 2)
 '(web-mode-markup-indent-offset 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit default :stipple nil :background "#333333" :foreground "#eee" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal :foundry "apple" :family "Monaco")))))
(put 'narrow-to-region 'disabled nil)

;; UTF-8 support
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) ; for eshell users
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))

(setq set-mark-command-repeat-pop t)

(progn
(global-set-key (kbd "C-=") 'hs-toggle-hiding)
(global-set-key (kbd "C-+") 'hs-hide-level)
(add-hook 'c-mode-common-hook   'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'java-mode-hook       'hs-minor-mode)
(add-hook 'lisp-mode-hook       'hs-minor-mode)
(add-hook 'perl-mode-hook       'hs-minor-mode)
(add-hook 'sh-mode-hook         'hs-minor-mode)
(add-hook 'php-mode-hook        'hs-minor-mode) )
(add-hook 'html-mode-hook        'web-mode)

;; Install Packages Using ELPA, MELPA, Marmalade
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
  )

;; Viewing the Common Lisp HyperSpec offline via Emacs
(global-set-key [(f2)] 'slime-hyperspec-lookup)
(setq common-lisp-hyperspec-root (expand-file-name ""))

(defun other-window-backward ()
  "Goto previous window."
  (interactive)
  (other-window -1))
(global-set-key (kbd "\C-x p") 'other-window-backward)

(autoload 'moz-minor-mode "moz" "Mozilla Minor and Inferior Mozilla Modes" t)

(add-hook 'javascript-mode-hook 'javascript-custom-setup)
(defun javascript-custom-setup ()
  (moz-minor-mode 1))

(add-to-list 'load-path (expand-file-name "/path/to/rbenv.el/"))

(defun figlet-region ()
  (interactive)
  (let ((b (if mark-active (min (point) (mark)) (line-beginning-position)))
        (e (if mark-active (max (point) (mark)) (line-end-position))))
    (shell-command-on-region b e "/usr/local/bin/figlet" (current-buffer) t)
    (comment-region (mark) (point))))

(put 'dired-find-alternate-file 'disabled nil)
(provide '.emacs)
;;; .emacs ends here
