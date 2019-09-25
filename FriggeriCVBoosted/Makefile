# A Simple Makefile for LaTeX
# Author: Lester James V. Miranda
# E-mail: ljvmiranda@gmail.com
# Modified by Jesper Dramsch
.DEFAULT_GOAL := default

# Default variables which can be edited via the terminal
comma := ,
BUILDDIR = _build
COMPILER = xelatex
BIBCOMPILER = biber
PROJECT = cv
BIBLIOGRAPHY = bibliography

pdf: headon clean
	@echo "Building $(PROJECT) in $(BUILDDIR) directory using $(COMPILER)."
	@echo "Creating $(BUILDDIR) directory..."
	@mkdir -p $(BUILDDIR)
	@$(COMPILER) -interaction=nonstopmode -halt-on-error -output-directory=$(BUILDDIR) $(PROJECT).tex
	@echo "First pass (via $(COMPILER)) done!"
	@cp $(BIBLIOGRAPHY).bib $(BUILDDIR)
	@$(BIBCOMPILER) --output_directory=$(BUILDDIR) $(PROJECT)
	@echo "Second pass (via $(BIBCOMPILER)) done!"
	@$(COMPILER) -interaction=nonstopmode -halt-on-error -output-directory=$(BUILDDIR) $(PROJECT).tex
	@echo "Third pass (via $(COMPILER)) done!"
	@$(COMPILER) -interaction=nonstopmode -halt-on-error -output-directory=$(BUILDDIR) $(PROJECT).tex
	@echo "Last pass (via $(COMPILER)) done!"
	@cp $(BUILDDIR)/$(PROJECT).pdf $(PROJECT)-$(subst $(comma),-,$(strip $(DOCOPTIONS))).pdf
	@echo "Compilation done. Output file is $(PROJECT)-$(subst $(comma),-,$(strip $(DOCOPTIONS))).pdf"


headon:
ifneq ($(OPTIN),)
	@$(eval DOCOPTIONS:=$(DOCOPTIONS),$(OPTIN))
endif
	@echo "\documentclass[$(DOCOPTIONS)]{friggeri-cv}" > .head

a4pdf:
	$(MAKE) headon OPTIN=a4pdf 
	$(MAKE) pdf DOCOPTIONS=$(DOCOPTIONS),a4pdf 

nocolors:  
	$(MAKE) headon OPTIN=nocolors
	$(MAKE) pdf DOCOPTIONS=$(DOCOPTIONS),print

print: 
	$(MAKE) headon OPTIN=print 
	$(MAKE) pdf DOCOPTIONS=$(DOCOPTIONS),print

custom: pdf 
	

default: pdf
	

clean:
	@rm -rf $(BUILDDIR)
	@echo "Removed $(BUILDDIR) directory"
