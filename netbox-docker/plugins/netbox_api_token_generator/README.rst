=====
Heading
=====
A Django Netbox plugin to expose API token generation API using basic authorization header

This Django Netbox plugin will expose a REST API 

> `GET /api/plugins/token/token`

with following required header parameters

- `Authorization: Basic <base64>` : The `Authorization` header will be base64 of `username:password` string
- `Z-Expires: yyyy-MM-dd`: The `X-Expires` is use to provide expiry for the token


Quick start
-----------
For installation of the Netbox plugin please refer to this (page)[https://netbox.readthedocs.io/en/stable/plugins/#installing-plugins]