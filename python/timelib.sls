include:
  - pip
  - gcc
{%- if grains['os_family'] not in ('Arch', 'Solaris', 'FreeBSD') %}
{#- These distributions don't ship the develop headers separately #}
  - headers
{% endif %}

timelib:
  pip.installed:
    - require:
      {%- if grains['os_family'] not in ('Arch', 'Solaris', 'FreeBSD') %}
      {#- These distributions don't ship the develop headers separately #}
      - pkg: python-dev
      {%- endif %}
      - pkg: gcc
      - pkg: python-pip
