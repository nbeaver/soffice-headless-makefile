ODS = $(wildcard *.ods)
XLSX = $(patsubst %.ods, %.xlsx, $(ODS))

all: $(XLSX)

%.xlsx : %.ods
	soffice -env:UserInstallation=file:///tmp/ --headless --convert-to xlsx $^

clean:
	rm -f $(XLSX)
