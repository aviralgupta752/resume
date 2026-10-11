# Resume build system.
# Edit aviral-gupta-resume.html, then run `make` to regenerate the PDF + DOCX.

RESUME := aviral-gupta-resume
CHROME := /Applications/Google Chrome.app/Contents/MacOS/Google Chrome

.PHONY: all pdf docx open preview clean help

all: pdf docx ## Build the PDF and the DOCX

pdf: ## Build the styled, print-ready PDF (headless Chrome)
	@"$(CHROME)" --headless=new --disable-gpu --no-pdf-header-footer \
		--print-to-pdf="$(CURDIR)/$(RESUME).pdf" "file://$(CURDIR)/$(RESUME).html" >/dev/null 2>&1
	@echo "built $(RESUME).pdf"

docx: ## Build the ATS / Word DOCX (macOS textutil)
	@textutil -convert docx "$(RESUME).html" -output "$(RESUME).docx"
	@echo "built $(RESUME).docx"

open: ## Open the HTML source in your default browser
	@open "$(RESUME).html"

preview: ## Render a PNG preview of the resume
	@"$(CHROME)" --headless=new --disable-gpu --hide-scrollbars --force-device-scale-factor=1.5 \
		--window-size=820,2520 --screenshot="$(CURDIR)/$(RESUME)-preview.png" \
		"file://$(CURDIR)/$(RESUME).html" >/dev/null 2>&1
	@echo "built $(RESUME)-preview.png"

clean: ## Remove generated files (PDF, DOCX, preview)
	@rm -f $(RESUME).pdf $(RESUME).docx $(RESUME)-preview.png
	@echo "cleaned generated files"

help: ## List available commands
	@grep -E '^[a-z]+:.*##' $(MAKEFILE_LIST) | sed 's/:.*##/ -/' | sort
