# tf-ipam

A terraform project to compare the IPAM softwares
- Netbox
- PhpIPAM

# tech stack

- docker
  For hosting Netbox, phpIPAM, OpenLDAP 

- OpenLDAP
  OpenLDAP is used to store all the user and there credentials for this experiement
 
- Hashicorp Vault
  Vault is used to host openldap secrets engine with rotating password for the LDAP users. It has to be connected to the OpenLDAP for user authentication as well so that user can use there login credentials to work with Vault.

- Netbox
  Netbox is configured to use OpenLDAP to authenticate users as well as it has been configured with a custom plugin `netbox-api-token-generator` which is used to generate custom API token.
  Refere `./netbox-docker/plugins/netbox-api-token-generator` for more information
  
- PhpIPAM
  PhpIPAM is configured with OpenLDAP to authenticate users

# setup

1. Run following command in this directory
   > docker-compos up
2. This will create phpIPAM, OpenLDAP and Vault 
3. Do not forget to enable OpenLDAP for Vault (help)[https://learn.hashicorp.com/tutorials/vault/openldap?in=vault/secrets-management]
4. Now on the other terminal, 
5. Goto `netbox-docker`
6. Generate a docker image, which has ldap and custom plugin installed, using the below command
   > docker build . --name netbox:latest-ldap-plugins
7. Run the docker-compose using the following command
   > docker-compose up
   Keep this running for debug purposes

# execution

1. Goto `tf-vault` directory, to link openldap credentials with Vault openldap secrets engine. 
2. Run the following command
   > terraform apply 
   This will create a secret `openldap/static-role/netbox`. To check please run the following command after `vault login`
   > vault read openldap/static-role/netbox
3. Goto `tf-ipam`, and run the following command
   > terraform apply
   This will read the `openldap/static-cred/netbox` rotating password, call the `netbox-api-token-generator` to get an API token and pass it to `tf-netbox` module to reserve an IP.

# gotchas

1. OpenLDAP has to be configured to have all the users and there respective service account with proper permissions
2. Netbox plugin, `netbox-api-token-generator`, to generate api token has to be maintained as it opensource


