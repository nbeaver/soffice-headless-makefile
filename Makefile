ODS := $(wildcard *.ods)
XLSX := $(patsubst %.ods, %.xlsx, $(ODS))

all: $(XLSX)

# https://bugs.documentfoundation.org/show_bug.cgi?id=37531
TMPDIR = $(shell mktemp -d)

# https://ask.libreoffice.org/en/question/2641/convert-to-command-line-parameter/
# https://cgit.freedesktop.org/libreoffice/core/tree/filter/source/config/fragments/filters/calc_MS_Excel_2007_XML.xcu
%.xlsx : %.ods
	soffice -env:UserInstallation=file://$(TMPDIR) --headless \
		--convert-to xlsx:"Calc MS Excel 2007 XML" $<


clean:
	rm -f -- $(XLSX)
