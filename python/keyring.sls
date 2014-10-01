include:
  - python.pip

keyring:
  pip.installed:
    {%- if salt['config.get']('virtualenv_path', None)  %}
    - bin_env: {{ salt['config.get']('virtualenv_path') }}
    {%- endif %}
    - upgrade: True
    - require:
      - cmd: python-pip
