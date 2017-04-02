az ad app create --display-name "Service Principal for BOSH" \
    --password "NemNibOrOg7" --homepage "http://BOSHAzureCPI-WDF" \
    --identifier-uris "http://BOSHAzureCPI-WDF"

az ad sp create --id c1c41a8e-cbcb-4f08-a1e5-c9afa3305d90
