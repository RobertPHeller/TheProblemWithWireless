##-*- makefile -*-############################################################
#
#  System        : 
#  Module        : 
#  Object Name   : $RCSfile$
#  Revision      : $Revision$
#  Date          : $Date$
#  Author        : $Author$
#  Created By    : Robert Heller
#  Created       : Thu Apr 19 13:41:01 2018
#  Last Modified : <180420.0903>
#
#  Description	
#
#  Notes
#
#  History
#	
#  $Log$
#
##############################################################################
#
#    Copyright (C) 2018  Robert Heller D/B/A Deepwoods Software
#			51 Locke Hill Road
#			Wendell, MA 01379-9728
#
#    This program is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 2 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program; if not, write to the Free Software
#    Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
#
# 
#
##############################################################################


PDFLATEX = /usr/bin/pdflatex
BIBTEX   = /usr/bin/bibtex

DOCUMENT = TheProblemWithWireless
PDF      = $(DOCUMENT).pdf
SRCTEX   = $(DOCUMENT).tex
BIBLIO   = $(DOCUMENT).bib
SRCFIGS  =

$(PDF) : $(SRCTEX) $(BIBLIO) $(SRCFIGS)
	$(PDFLATEX) $(DOCUMENT).tex
	$(BIBTEX) $(DOCUMENT).aux
	$(PDFLATEX) $(DOCUMENT).tex
	latex_count=5 ; \
	while egrep -s 'Rerun to get cross-references right' $(DOCUMENT).log && [ $$latex_count -gt 0 ] ;\
	   do \
	     echo "Rerunning latex...." ;\
	     $(PDFLATEX) $(DOCUMENT).tex ;\
	     latex_count=`expr $$latex_count - 1` ;\
	   done
	   
clean:
	rm -f *.ps *.dvi *.aux *.toc *.idx *.ind *.ilg *.log *.out *.bbl *.blg *.brf *.lo? $(PDF)

	
