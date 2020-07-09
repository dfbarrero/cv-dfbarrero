all: pdf

FILE=cv

pdf: $(FILE).pdf
#	xdg-open $(FILE).dvi

$(FILE).pdf: $(FILE).aux $(FILE).tex
	xelatex $(FILE).tex

clean:
	rm *.aux *.dvi *.log *.blg

$(FILE).aux:
	xelatex $(FILE).tex
	biber $(FILE)
	xelatex $(FILE).tex
	xelatex $(FILE).tex

view: $(FILE).dvi
	xdvi $(FILE).dvi
