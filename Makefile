# Resume build system
# Editable source files live in root; all generated files go to $(OUT_DIR)/

RESUME := aviral-gupta-resume
OUT_DIR := generated
TECTONIC := $(shell which tectonic 2>/dev/null)
PDFLATEX := $(shell which pdflatex 2>/dev/null)
CHROME := /Applications/Google Chrome.app/Contents/MacOS/Google Chrome

.PHONY: all pdf html-pdf validate open clean help

all: pdf ## Build the PDF from LaTeX into $(OUT_DIR)/

pdf: ## Build PDF from LaTeX source ($(RESUME).tex)
	@mkdir -p $(OUT_DIR)
	@if [ -n "$(TECTONIC)" ]; then \
		$(TECTONIC) -o $(OUT_DIR) $(RESUME).tex; \
	elif [ -n "$(PDFLATEX)" ]; then \
		$(PDFLATEX) -output-directory=$(OUT_DIR) $(RESUME).tex >/dev/null; \
	else \
		echo "Error: Neither tectonic nor pdflatex found. Install with: brew install tectonic"; exit 1; \
	fi
	@echo "built $(OUT_DIR)/$(RESUME).pdf"

validate: pdf ## Validate generated PDF for ATS compliance and single-page length
	@node scripts/ats-validate.js $(OUT_DIR)/$(RESUME).pdf

html-pdf: ## Alternative: Build PDF from HTML using headless Chrome
	@mkdir -p $(OUT_DIR)
	@"$(CHROME)" --headless=new --disable-gpu --no-pdf-header-footer \
		--print-to-pdf="$(CURDIR)/$(OUT_DIR)/$(RESUME).pdf" "file://$(CURDIR)/$(RESUME).html" >/dev/null 2>&1
	@echo "built $(OUT_DIR)/$(RESUME).pdf from HTML"

open: ## Open generated PDF in default viewer
	@open "$(OUT_DIR)/$(RESUME).pdf"

clean: ## Remove generated directory
	@rm -rf $(OUT_DIR)
	@echo "cleaned $(OUT_DIR)/"

help: ## List available commands
	@grep -E '^[a-z_-]+:.*##' $(MAKEFILE_LIST) | sed 's/:.*##/ -/' | sort
