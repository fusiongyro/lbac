all: $(patsubst %.txt,%.html,$(wildcard *.txt))

%.html: %.txt header.html footer.html rebuild.sh
	./rebuild.sh $< > $@