# Make file for math2d note repository

EXPORTDIR:=./pdf

.PHONY: help exportall exportfile exportdir clean
help:
	@echo "exportall: Export all notes in this repository to a pdf"
	@echo "exportdir: Export all notes in the given directory to a pdf"
	@echo "exportfile: Export the given file to a pdf"
	@echo "help: Print this message and exit"

clean:
	rm -rf $(EXPORTDIR)

prepare:
	@echo "Prepare $(EXPORTDIR)"
	@for week in 1 2 3 4 5 6 7 8 9 10 ; do \
		mkdir -p $(EXPORTDIR)/week$${week} ; \
	done

exportall:
	@echo "Exporting all notes"
	@for name in $(shell ls $(shell pwd)) ; do \
		if  [[ -d $${name} ]] && [[ "$${name:0: 4}" == "week"  ]]  ; then \
			make exportdir DIR=$${name} ; \
		fi \
	done
	@echo "Exported all notes to $(EXPORTDIR)"

exportdir: checkdirdefined checkdirexists
	@for file in $(shell ls $(DIR)) ; do \
		if [ "$${file: -3}" == ".md" ] ; then \
			make exportfile FILE=$(DIR)/$${file} ; \
		fi \
	done
	@echo "Exported $(DIR) -> $(EXPORTDIR)/$(DIR)"

checkdirdefined:
ifdef DIR
	@echo "Directory to export: $(DIR)"
else
	$(error "NO DIR GIVEN TO EXPORT")
endif

checkdirexists:
ifeq ($(shell [ -d $(DIR) ]; echo $$?), 0)
	@echo "Looking for: $(DIR) -- found"
else
	@echo "Looking for: $(DIR) -- not found"
	$(error "THE GIVEN DIR DOES NOT EXIST")
endif

exportfile: checkfiledefined checkfileexists prepare
	@for name in $(subst /, ,$(FILE)) ; do \
		if [ "$${name: -3}" == ".md" ] ; then \
			pandoc -V geometry:margin=1in -o ../pdf/$(strip $(subst .md,.pdf, $(FILE))) $${name} ; \
		else \
			cd $${name} ; \
		fi \
	done
	@echo "Exported $(FILE) -> $(EXPORTDIR)/$(strip $(subst .md,.pdf, $(FILE)))"
	
# pandoc -V geometry:margin=1in -o ./pdf/$(strip $(subst .md,.pdf, $(FILE))) $(FILE)

checkfiledefined:
ifdef FILE
	@echo "File to export: $(FILE)"
else
	$(error "NO FILE GIVEN TO EXPORT")
endif

checkfileexists:
ifeq ($(shell [ -e $(FILE) ]; echo $$?), 0)
	@echo "Looking for: $(FILE) -- found"
else
	@echo "Looking for: $(FILE) -- not found"
	$(error "THE GIVEN FILE DOES NOT EXIST")
endif
