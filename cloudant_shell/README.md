# Cloudant shell script
[IBM Cloudant](https://www.ibm.com/cloud/cloudant) is a managed CouchDB offering by IBM.
This script sets up a few things locally in your environment so that you can easily run simple queries to your Cloudant DB via curl. It gets an IAM token, exports a few Cloudant-related variables and creates a curl alias `acurl` which uses this token transparently to you.

Run like:
`. cloudant_setup.sh api_key external_endpoint_url`

You can then do cloudant queries simply by:
`acurl ${CLOUDANT_URL}/api-query` e.g. `acurl ${CLOUDANT_URL}/_all_dbs`

### Notes:
Use `jq` to further print or process the returned json. E.g. `acurl ${CLOUDANT_URL}/_all_dbs | jq .`
