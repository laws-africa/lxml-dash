# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line, and also
# from the environment for the first two.
SPHINXOPTS    ?=
SPHINXBUILD   ?= sphinx-build
SOURCEDIR     = .
BUILDDIR      = _build

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

html:
	@$(SPHINXBUILD) -b html "$(SOURCEDIR)" -d "$(BUILDDIR)/doctrees" docs $(SPHINXOPTS) $(O)

clean:
	rm -rf docs *.docset _autosummary

# sphinx generates duplicate index entries, one under the "std:doc" scope and the other under "py:".
# this results in duplicate "Class" and "Guide" sections in Dash. I can't work out how to tell sphinx to index elements
# only under the "py:" scope, so we manipulate the objects.inv to remove the "std" scope.
fixobjects:
	sphobjinv convert plain docs/objects.inv - | fgrep -v 'std:doc -1 _autosummary' | sphobjinv convert zlib - objects.inv.new
	mv objects.inv.new docs/objects.inv

dash: clean html fixobjects
	doc2dash -a -n lxml docs


.PHONY: help Makefile

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
