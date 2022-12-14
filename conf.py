import os
import sys
sys.path.insert(0, os.path.abspath('../../src'))

from lxml import __version__ as lxml_version

# -- Project information -----------------------------------------------------

project = 'lxml'
copyright = '2020, lxml dev team'
author = 'lxml dev team'
version = lxml_version


# -- General configuration ---------------------------------------------------

extensions = [
    'sphinx.ext.autodoc',
    'sphinx.ext.autosummary',
    'sphinx.ext.viewcode',
]
autosummary_generate = True
templates_path = ['_templates']

language = 'en'

exclude_patterns = ['_build', 'env']


# -- Options for HTML output -------------------------------------------------

html_theme = 'pyramid'

html_logo = '../html/python-xml.png'

# Add any paths that contain custom static files (such as style sheets) here,
# relative to this directory. They are copied after the builtin static files,
# so a file named "default.css" will overwrite the builtin "default.css".
#html_static_path = ['_static']

html_theme_options = {
    'collapse_navigation': False,
    'titles_only': True,
}

# -- Extension configuration -------------------------------------------------

autodoc_default_options = {
    'ignore-module-all': True,
    'private-members': True,
    'inherited-members': True,
}

autodoc_member_order = 'groupwise'

# -- Options for todo extension ----------------------------------------------

# If true, `todo` and `todoList` produce output, else they produce nothing.
#todo_include_todos = True

html_sidebars = {
    '**': []
}
