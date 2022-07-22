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
       (list "aodotcomorg"
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
	     )
       (list "aodotcomimg"
	     :recursive t
	     :base-directory "./content"
             :base-extension "jpg\\|png"
	     :publishing-directory "~/Dropbox/docs/aodotcom/htdocs"
	     :publishing-function 'org-publish-attachment
	     )
       (list "aodotcomother"
	     :recursive t
	     :base-directory "./content"
             :base-extension "html\\|txt\\|pdf"
	     :publishing-directory "~/Dropbox/docs/aodotcom/htdocs"
	     :publishing-function 'org-publish-attachment
	     )))

;; Generate the site output (all files from scratch)
(org-publish-all t)

(message "Build complete!")
