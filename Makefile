xelatex : clean
	xelatex EE-dyplom
	biber EE-dyplom
	makeglossaries EE-dyplom
	xelatex EE-dyplom
	xelatex EE-dyplom

pdflatex : clean
	pdflatex EE-dyplom
	biber EE-dyplom
	makeglossaries EE-dyplom
	pdflatex EE-dyplom
	pdflatex EE-dyplom
	
sololetters:
	sed -i 's/ a / a\~/g' tekst/*.tex
	sed -i 's/ i / i\~/g' tekst/*.tex
	sed -i 's/ w / w\~/g' tekst/*.tex
	sed -i 's/ z / z\~/g' tekst/*.tex
	sed -i 's/ u / u\~/g' tekst/*.tex
	sed -i 's/ o / o\~/g' tekst/*.tex
	sed -i 's/ A / A\~/g' tekst/*.tex
	sed -i 's/ I / I\~/g' tekst/*.tex
	sed -i 's/ W / W\~/g' tekst/*.tex
	sed -i 's/ Z / Z\~/g' tekst/*.tex
	sed -i 's/ U / U\~/g' tekst/*.tex
	sed -i 's/ O / O\~/g' tekst/*.tex

clean :
	-rm *.acn *.app *.aux *.bbl *.blg *.bcf *.glo *.ist *.lof *.log *.lot *.out *.pdf *.run.xml *.slo *.toc
