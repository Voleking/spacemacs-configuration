;;; packages.el --- Org Layer packages File for Spacemacs
;;
;; Copyright (c) 2017-2018 Tshu Wang
;;
;; Author: Tshu Wang <volekingsg@gmail.com>
;; URL: https://github.com/Voleking/spacemacs-configuration
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(setq my-org-packages '(org-gcal))

(defun my-org/init-org-gcal ()
  (use-package org-gcal
    :defer t
    :init
    (add-hook 'org-agenda-mode-hook (lambda () (org-gcal-sync nil t t)))
    (add-hook 'org-capture-after-finalize-hook (lambda () (org-gcal-sync nil t t)))
    ))
