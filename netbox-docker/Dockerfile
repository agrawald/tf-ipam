FROM netboxcommunity/netbox:latest-ldap

COPY ./plugin_requirements.txt /
COPY ./plugins/netbox_api_token_generator /opt/netbox/netbox/netbox_api_token_generator
RUN /opt/netbox/venv/bin/pip install  --no-warn-script-location -r /plugin_requirements.txt

# These lines are only required if your plugin has its own static files.
COPY configuration/configuration.py /etc/netbox/config/configuration.py
RUN SECRET_KEY="dummy" /opt/netbox/venv/bin/python /opt/netbox/netbox/manage.py collectstatic --no-input
