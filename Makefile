ODS := $(wildcard *.ods)
XLSX := $(patsubst %.ods, %.xlsx, $(ODS))

all: $(XLSX)

# https://bugs.documentfoundation.org/show_bug.cgi?id=37531
TMPDIR = $(shell mktemp -d)
%.xlsx : %.ods
	soffice -env:UserInstallation=file://$(TMPDIR) --headless --convert-to xlsx $^

clean:
	rm -f $(XLSX)
