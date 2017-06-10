;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     osx
     (chinese :variables
              chinese-enable-fcitx t)
     dash
     git
     github
     pandoc
     (c-c++ :variables
            c-c++-default-mode-for-headers 'c++-mode
            c-c++-enable-clang-support nil)
     emacs-lisp
     html
     java
     (markdown :variables
               markdown-command "pandoc -t html5 -f markdown -s -S --mathjax --highlight-style=pygments --toc --toc-depth 3 --template github.html5 --css html/css/github.css"
               markdown-live-preview-engine 'pandoc)
     (org :variables
          org-agenda-files '("~/Documents/Org")
          org-directory '"~/Documents/Org")
     (python :variables
             python-enable-yapf-format-on-save t)
     (auto-completion :variables
                      auto-completion-enable-help-tooltip t
                      auto-completion-enable-help-tooltip 'manual
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-sort-by-usage t
                      :disabled-for org markdown)
     (shell :variables
            shell-default-shell 'multi-term
            shell-default-height 80
            shell-default-position 'bottom)
     (syntax-checking :variables
                      flycheck-delayed-errors-timeout 500)
     (wakatime :variables
               wakatime-api-key  "2ccf4cb6-4369-40b5-9165-718666b8bb32"
               wakatime-cli-path "/usr/local/bin/wakatime")
     ;; spell-checking
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(org-mac-link org-alert helm-github-stars noflet)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(helm-dash exec-path-from-shell neotree )
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non-nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non-nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, `J' and `K' move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non-nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts t
   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands.
   dotspacemacs-auto-generate-layout-names nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non-nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non-nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non-nil the paste micro-state is enabled. When enabled pressing `p'
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil
   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup t
   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non-nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers '(:relative nil
                                         :disabled-for-modes dired-mode
                                         doc-view-mode
                                         markdown-mode
                                         org-mode
                                         pdf-view-mode
                                         text-mode
                                         :size-limit-kb 1000)
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   dotspacemacs-frame-title-format "%I@%S"
   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'trailing
   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  (setq-default git-magit-status-fullscreen t)
  )

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."

  ;; Env
  ;;
  (set-language-environment "UTF-8")
  (set-default-coding-systems 'utf-8)
  (setenv "LANG" "zh_CN.UTF-8")
  (setenv "LC_TIME" "C")
  (setenv "LC_NUMERIC" "C")
  (setq helm-github-stars-username "Voleking")
  (setq helm-github-stars-refetch-time 1)
  (when (string= system-type "darwin")
    (setq dired-use-ls-dired nil))
  (setq my-snippet-dir (expand-file-name "~/.spacemacs.d/snippets"))

  ;; Appearance
  ;;
  (spacemacs//set-monospaced-font   "Source Code Pro" "PingFang Sc" 13 15)
  (spacemacs/toggle-mode-line-minor-modes-off)
  (setq display-time-24hr-format t
        display-time-default-load-average nil)
  (setq powerline-default-separator 'slant)
  (golden-ratio-mode t)
  (setq org-bullets-bullet-list '("◉" "○" "✸" "✿" "▲" "▶" "■" "◆"))
  (global-git-commit-mode t)

  ;; Edit Style & Keybinding
  ;;
  (spacemacs/set-leader-keys "o" (lookup-key global-map (kbd "C-c")))
  (spacemacs/set-leader-keys "o g" 'org-mac-grab-link)
  (global-set-key (kbd "s-b") 'compile)
  (global-set-key (kbd "s-r") 'run)
  (global-set-key (kbd "s-/") (lookup-key global-map (kbd "M-;")))
  (global-set-key (kbd "<s-backspace>") 'clean-aindent--bsunindent)

  ;; Functions
  ;;
  (defun notify-osx (title message)
    (call-process "terminal-notifier"
                  nil 0 nil
                  ;;"-sender" "org.gnu.Emacs"
                  "-group" "Emacs"
                  "-title" title
                  "-message" message
                  "-activate" "org.gnu.Emacs"))
  ;; C++
  ;;
  (setq c-default-style "k&r")
  (setq c-basic-offset 4)
  (setq-default flycheck-gcc-language-standard "c++11")
  (setq-default flycheck-clang-language-standard "c++11")
  (setq company-c-headers-path-system '("/usr/include/c++/4.2.1" "/usr/include" "/usr/local/include"))

  (require 'compile)
  (add-hook 'c++-mode-hook
            (lambda ()
              (unless (or (file-exists-p "makefile")
                          (file-exists-p "Makefile"))
                (set (make-local-variable 'compile-command)
                     (concat "make -k "
                             (if buffer-file-name
                                 (shell-quote-argument
                                  (file-name-sans-extension buffer-file-name))))))))
  (add-hook 'c-mode-hook
            (lambda ()
              (unless (or (file-exists-p "makefile")
                          (file-exists-p "Makefile"))
                (set (make-local-variable 'compile-command)
                     (concat "make -k "
                             (if buffer-file-name
                                 (shell-quote-argument
                                  (file-name-sans-extension buffer-file-name))))))))
  (defun run()
    (interactive)
    (shell-command
     (concat "make -k "
             (if buffer-file-name
                 (shell-quote-argument
                  (file-name-sans-extension buffer-file-name)))
             " && open "
             (if buffer-file-name
                 (shell-quote-argument
                  (file-name-sans-extension buffer-file-name))))))

  ;; Python
  ;;
  (setq-default python-shell--interpreter '"python")
  (setq-default python-indent-offset 4)

  ;; Org
  ;;
  (with-eval-after-load 'org
    (setq org-startup-indented t)
    (setq org-agenda-span 'day)
    (setq org-refile-targets
          '((nil :maxlevel . 1)
            (org-agenda-files :maxlevel . 2)))
    (setq org-agenda-file-gtd (expand-file-name "gtd.org" org-directory))
    (setq org-agenda-file-note (expand-file-name "notes.org" org-directory))
    (setq org-agenda-file-journal (expand-file-name "journal.org" org-directory))
    (setq org-agenda-gcal-file (expand-file-name "gcal.org" org-directory))
    (setq org-default-notes-file (expand-file-name "gtd.org" org-directory))

    (setq-default dotspacemacs-configuration-layers
                  '((org :variables org-projectile-file "TODOs.org")))
    (with-eval-after-load 'org-agenda
      (require 'org-projectile)
      (setq org-agenda-files (append org-agenda-files (org-projectile:todo-files))))

    (setq org-capture-templates
          '(("t" "Todo" entry (file+headline org-agenda-file-gtd "Tasks")
             "* TODO %?\n  %i\n")
            ("n" "Notes" entry (file+headline org-agenda-file-note "Quick notes")
             "* %?\n  %i\n %T\n"
             :empty-lines 1)
            ("a" "Assignments" entry (file+headline org-agenda-file-gtd "Assignments")
             "* TODO [#A] %?\n  %i\n")
            ("i" "Inbox" entry (file+headline org-agenda-file-gtd "Inbox")
             "* %?\n  %i\n")
            ("j" "Journal" entry (file+datetree org-agenda-file-journal)
             "* %?\n"
             :empty-lines 1)
            ("l" "Link" entry (file+headline org-agenda-file-gtd "Inbox")
             "* [[%l][%:description]]\n %i\n")
            ))

    (org-babel-do-load-languages
     'org-babel-load-languages
     '(
       (python . t)
       (emacs-lisp . t)
       (C . t)
       (latex . t)))
    ;; default options for all output formats
    (setq org-pandoc-options '((standalone . t)))
    ;; cancel above settings only for 'docx' format
    (setq org-pandoc-options-for-docx '((standalone . nil)))
    ;; special settings for beamer-pdf and latex-pdf exporters
    (setq org-pandoc-options-for-beamer-pdf '((latex-engine . "xelatex")))
    (setq org-pandoc-options-for-latex-pdf '((latex-engine . "xelatex")
                                             (template . "eisvogel.latex")))

    ;; Org Agent alert
    ;; https://emacs-china.org/t/org-agenda/232
    (require 'appt)
    (setq appt-time-msg-list nil)    ;; clear existing appt list
    (setq appt-display-interval '10)  ;; warn every 10 minutes from t - appt-message-warning-time
    (setq
      appt-message-warning-time '15  ;; send first warning 15 minutes before appointment
      appt-display-mode-line nil     ;; don't show in the modeline
      appt-display-format 'window)   ;; pass warnings to the designated window function
    (appt-activate 1)                ;; activate appointment notification
    (display-time)                   ;; activate time display
    )
    (with-eval-after-load 'org-agenda
      (org-agenda-to-appt))
    ;; (org-agenda-to-appt)             ;; generate the appt list from org agenda files on emacs launch
    (run-at-time "24:01" 3600 'org-agenda-to-appt)           ;; update appt list hourly
    (add-hook 'org-finalize-agenda-hook 'org-agenda-to-appt) ;; update appt list on agenda view
    (defun my-appt-display (min-to-app new-time msg)
      (notify-osx
      (format "Appointment in %s minutes" min-to-app)    ;; passed to -title in terminal-notifier call
      (format "%s" msg)))                                ;; passed to -message in terminal-notifier call
    (setq appt-disp-window-function (function my-appt-display))
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (org-mac-link org-alert noflet helm-github-stars yapfify xterm-color web-mode wakatime-mode tagedit smeargle slim-mode shell-pop scss-mode sass-mode reveal-in-osx-finder realgud test-simple loc-changes load-relative pyvenv pytest pyenv-mode py-isort pug-mode pip-requirements pbcopy pangu-spacing pandoc-mode ox-pandoc osx-trash osx-dictionary orgit org-projectile org-present org-pomodoro alert log4e gntp org-download multi-term mmm-mode meghanada markdown-toc markdown-mode magithub ghub+ apiwrap ghub magit-gitflow magit-gh-pulls live-py-mode less-css-mode launchctl hy-mode htmlize helm-pydoc helm-gitignore helm-dash helm-css-scss helm-company helm-c-yasnippet haml-mode groovy-mode groovy-imports gradle-mode gnuplot gitignore-mode github-search github-clone gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gist gh marshal logito pcache ht gh-md fuzzy flycheck-pos-tip flycheck find-by-pinyin-dired fcitx evil-org evil-magit magit magit-popup git-commit with-editor eshell-z eshell-prompt-extras esh-help ensime sbt-mode scala-mode emmet-mode disaster diff-hl dash-at-point cython-mode company-web web-completion-data company-statistics company-quickhelp company-emacs-eclim eclim company-c-headers company-anaconda company cmake-mode clang-format chinese-pyim chinese-pyim-basedict pos-tip browse-at-remote auto-yasnippet yasnippet anaconda-mode pythonic ace-pinyin pinyinlib ac-ispell auto-complete ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org symon string-inflection spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el password-generator paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-purpose window-purpose imenu-list helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-lion evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav editorconfig dumb-jump f s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed dash aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
