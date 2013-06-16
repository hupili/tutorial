# -*- coding: utf-8 -*-
#
# Render README.md of each tutorials
#
# Run this script at the tutorial root

import os
import jinja2
import json

template = jinja2.Template(open('README.tpl.md').read())

dir_tutorial_root = os.path.abspath(os.path.dirname(__file__))

import re
PATTERN_SKIP = re.compile('^\.|~$')
from itertools import compress
def filter_paths(paths):
    # Ref:
    #    * http://stackoverflow.com/questions/8312829/how-to-remove-item-from-a-python-list-if-a-condition-is-true
    selectors = ((not PATTERN_SKIP.search(d)) for d in paths)
    i = 0
    for i, v in enumerate(compress(paths, selectors)):
        paths[i] = v
    del paths[i+1:]

def render_md(root):
    '''
    Render MD. 

    A 'meta.json' file should be placed in ``root``
    '''
    auto = {}
    auto['path'] = root[2:]
    try:
        auto['body'] = open('%s/%s' % (root, '_README.md'), 'r').read()
    except Exception as e:
        auto['body'] = ''
    meta = json.loads(open('%s/%s' % (root, 'meta.json'), 'r').read())
    result = template.render({'meta': meta, 'auto': auto})
    open('%s/README.md' % (root), 'w').write(result)

if __name__ == '__main__':
    for root, dirs, files in os.walk('.'):
        filter_paths(dirs)
        filter_paths(files)
        for name in files:
            if name == 'meta.json':
                render_md(root)
