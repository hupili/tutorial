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

def render_md(info):
    '''
    Render MD. 

    A 'meta.json' file should be placed in ``root``
    '''
    root = './' + info['auto']['path']
    result = template.render(info)
    open('%s/README.md' % (root), 'w').write(result)

if __name__ == '__main__':
    import pickle
    all_info = pickle.loads(open('info.pickle', 'r').read())
    for info in all_info:
        render_md(info)
