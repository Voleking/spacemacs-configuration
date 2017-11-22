;;; keybindings.el --- Org Layer packages File for Spacemacs
;;
;; Copyright (c) 2017 Voleking
;;
;; Author: Sylvain Benner <volekingsg@gmail.com>
;; URL: https://github.com/Voleking/spacemacs-configuration
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; Edit Style & Keybinding
;;
;; (evil-leader/set-key
;;   "q q" 'spacemacs/frame-killer)
;; (evil-ex-define-cmd "q[uit]" 'evil-delete-buffer)
(spacemacs/set-leader-keys "o" (lookup-key global-map (kbd "C-c")))
(spacemacs/set-leader-keys "o g" 'org-mac-grab-link)
(spacemacs/set-leader-keys "a o g" 'org-mac-grab-link)
(global-set-key (kbd "H-'") 'iterm-goto-filedir-or-home)
(global-set-key (kbd "H-.") 'iterm-focus)
(global-set-key (kbd "H-b") 'compile)
(global-set-key (kbd "H-r") 'run-current-file)
(global-set-key (kbd "H-/") 'comment-dwim)
(global-set-key (kbd "<H-backspace>") 'clean-aindent--bsunindent)

(with-eval-after-load 'evil-maps
  (define-key evil-normal-state-map (kbd "DEL") 'evil-repeat-find-char-reverse)
  (define-key evil-insert-state-map (kbd "C-c u") 'backward-kill-line)
  (define-key evil-insert-state-map (kbd "C-c w") 'backward-kill-word))
(evil-define-key 'insert org-mode-map (kbd "<tab>") #'org-cycle)
