# -*- coding: utf-8 -*-
#
# Render README.md of each tutorials
#
# Run this script at the tutorial root

import os
import json

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

def collect_meta():
    all_info = []
    for root, dirs, files in os.walk('.'):
        filter_paths(dirs)
        filter_paths(files)
        for name in files:
            if name == 'meta.json':
                auto = {}
                auto['path'] = root[2:]
                try:
                    auto['body'] = open('%s/%s' % (root, '_README.md'), 'r').read()
                except Exception as e:
                    auto['body'] = ''
                meta = json.loads(open('%s/%s' % (root, 'meta.json'), 'r').read())
                all_info.append({'meta': meta, 'auto': auto})
    return all_info

if __name__ == '__main__':
    import pickle
    open('info.pickle', 'w').write(pickle.dumps(collect_meta()))
