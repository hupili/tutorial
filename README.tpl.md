# {{ meta.title }}

{{ auto.body }}

{% set lb = '{' %}
{% set rb = '}' %}

## Citation Notes

If you find anything useful and want to build 
your future work on it, please cite this page properly. 
One suggested entry:

```
Pili HU, {{ meta.title }}, https://github.com/hupili/tutorial/tree/master/{{ auto.path }}
```

One suggested BibTex entry:

```
@MISC{{lb}}{{ meta.bib_key }},
	author = {{lb}}Hu, Pili{{rb}},
	title = {{lb}}{{ meta.title }}{{rb}},
	howpublished = {{lb}}GitHub, https://github.com/hupili/tutorial/tree/master/{{ auto.path}}{{rb}},
	month = {{lb}}{{ meta.month }}{{rb}},
	year = {{lb}}{{ meta.year }}{{rb}}
}
```

