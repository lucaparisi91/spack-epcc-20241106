
{% extends "modules/modulefile.lua" %}



{% block environment %}

{% endblock %}


{% block provides %}

family("spack_compiler")

{% if spec.name == 'gcc'  %}
load("PrgEnv-gnu")
{% endif %}

{% if spec.name == 'cce'  %}
load("PrgEnv-cray")
{% endif %}

{% if spec.name == 'aocc'  %}
load("PrgEnv-aocc")
{% endif %}


{% if has_modulepath_modifications %}


-- Loading this module unlocks the path below unconditionally
{% for path in unlocked_paths %}
prepend_path("MODULEPATH", "{{ path }}")
{% endfor %}

{% endif%}
{% endblock%}

