# -*- coding: utf-8 -*-
#
# Render README.md of each tutorials
#
# Run this script at the tutorial root

import os
import shutil
import jinja2
import json

template = jinja2.Template(open('page.tpl.md').read())

def build_tutorial(info):
    root = './' + info['auto']['path']
    target = './webpage/' + info['meta']['bib_key']
    try:
        os.makedirs(target)
    except:
        # The file already exists
        pass
    #shutil.copy(root + '/README.md', target + 'README.md')
    info['auto']['readme'] = open('%s/README.md' % (root), 'r').read()
    result = template.render(info)
    open('%s/%s.md' % (target, info['meta']['bib_key']), 'w').write(result)
    if 'files' in info['meta']:
        for file in info['meta']['files']:
            src = '%s/%s' % (root, file['src'])
            dst = '%s/%s' % (target, file['dst'])
            shutil.copy(src, dst)

if __name__ == '__main__':
    import pickle
    all_info = pickle.loads(open('info.pickle', 'r').read())
    for info in all_info:
        build_tutorial(info)
