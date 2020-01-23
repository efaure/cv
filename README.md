
## CV LaTex sources

Based on template https://fr.sharelatex.com/templates/cv-or-resume/smart-fancy-cv

To build CV in PDF format :
```bash
$ xelatex cv-eloise.tex
```

To build CV in PDF format including phone number :
```bash
xelatex '\def\PhoneNumber{+33 0 00 00 00 00}\input cv-eloise.tex'

```

To convert it to HTML using pdf2htmlEX container :
```bash
docker run -ti --rm -v `pwd`:/pdf bwits/pdf2htmlex pdf2htmlEX cv-eloise.pdf
```
