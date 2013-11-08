all: $(patsubst %.md,%.html,$(wildcard *.md)) book.pdf book.html

%.html: %.md header.html footer.html rebuild.sh
	./rebuild.sh $< > $@

book.html: $(wildcard *.xml)
	xsltproc --xinclude /opt/local/share/xsl/docbook-xsl/xhtml5/docbook.xsl book.xml > book.html

book.fo: $(wildcard *.xml)
	xsltproc --xinclude --stringparam xep.extensions 1 --stringparam title.font.family "AcademyEngravedLET" --stringparam body.font.family "Gill Sans MT Pro Book" --stringparam monospace.font.family "PragmataPro" /opt/local/share/xsl/docbook-xsl/fo/docbook.xsl book.xml > book.fo

book.pdf: book.fo
	~/XEP/xep book.fo book.pdf
