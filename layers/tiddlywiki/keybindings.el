;;; keybindings.el --- Org Layer packages File for Spacemacs
;;
;; Copyright (c) 2018 Voleking
;;
;; Author: Sylvain Benner <volekingsg@gmail.com>
;; URL: https://github.com/Voleking/spacemacs-configuration
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(spacemacs/declare-prefix "aw" "wiki")
(spacemacs/set-leader-keys
  "awd" 'open-wiki
  "awb" 'browse-wiki)
