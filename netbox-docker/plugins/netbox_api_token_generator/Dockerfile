FROM netboxcommunity/netbox:latest

COPY ./plugin_requirements.txt /
COPY ./plugins/netbox_api_token_generator /opt/netbox/netbox/netbox_api_token_generator
RUN /opt/netbox/venv/bin/pip install  --no-warn-script-location -r /plugin_requirements.txt
