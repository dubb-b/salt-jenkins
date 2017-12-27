{% if grains['os'] not in ('Windows',) %}
include:
  - python.pip
{% endif %}

clustershell:
  pip.installed:
    - name: clustershell
    {%- if salt['config.get']('virtualenv_path', None)  %}
    - bin_env: {{ salt['config.get']('virtualenv_path') }}
    {%- endif %}
{% if grains['os'] not in ('Windows',) %}
    - require:
      - cmd: pip-install
{% endif %}