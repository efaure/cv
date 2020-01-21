
## CV LaTex sources

Based on template https://fr.sharelatex.com/templates/cv-or-resume/smart-fancy-cv

To build CV in PDF format run :
```bash
$ xelatex cv-eloise.tex
```

To convert it to HTML using pdf2htmlEX container :
```bash
docker run -ti --rm -v `pwd`:/pdf bwits/pdf2htmlex pdf2htmlEX cv-eloise.pdf
```
