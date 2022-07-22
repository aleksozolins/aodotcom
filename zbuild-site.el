;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; htmlize for syntax highlighting in source blocks
(use-package htmlize
  :ensure t)

;; what syntax highlighting should be used. Somewhat problematic because
;; it is dependant on the standard emacs theme instead of the
;; page theme
(setq org-html-htmlize-output-type 'css)

;; load the publishing system
(require 'ox-publish)

(setq org-html-validation-link nil             ;; Don't show validation link
      org-html-head-include-scripts nil        ;; Use our own scripts
      org-export-with-properties t             ;; Export with properties drawers
      org-html-head-include-default-style nil  ;; Use our own styles
      org-html-head "<link rel=\"stylesheet\" href=\"https://cdn.simplecss.org/simple.min.css\" />"
      )

;; Define the publishing project
(setq org-publish-project-alist
      (list
       (list "aodotcomzap"
	     :recursive t
	     :base-directory "./content"
	     :publishing-directory "~/Dropbox/docs/aodotcom/htdocs"
	     :publishing-function 'org-html-publish-to-html
	     :with-author nil          ;; Don't include authoer name
	     :with-creator t           ;; Include Emacs and Org versions in footer
	     :with-toc t               ;; Include a table of contents
	     :section-numbers nil      ;; Don't include section numbers
	     :time-stamp-file nil      ;; Don't include time stamp in file
             :with-planning t          ;; Include deadlines, etc.
             :with-properties nil      ;; Don't include the PROPERTIES drawer
	     :exclude ".*"             ;; Exclude all files
	     :include ["zpage.org" "rpn.org"]    ;; Include just the Zapier file
	     )))

;; Generate the site output (all files from scratch)
(org-publish-all t)

(message "Build complete!")
