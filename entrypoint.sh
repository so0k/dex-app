#!/bin/bash

EXAMPLE_APP=("/bin/dex-app")

: ${DEX_ISSUER?" is empty string"}
EXAMPLE_APP+=( --issuer $DEX_ISSUER )

: ${DEX_APP_LISTEN_ADDRESS?" is empty string"}
EXAMPLE_APP+=( --listen ${DEX_APP_LISTEN_ADDRESS} )

: ${DEX_APP_REDIRECT_URI?" is empty string"}
EXAMPLE_APP+=( --redirect-uri ${DEX_APP_REDIRECT_URI})

if [[ ! -z "${DEX_CA}" ]]; then
    EXAMPLE_APP+=(--issuer-root-ca ${DEX_CA})
fi

if [[ ! -z "${DEX_CERT}" ]]; then
    EXAMPLE_APP+=(--tls-cert ${DEX_CERT})
fi

if [[ ! -z "${DEX_KEY}" ]]; then
    EXAMPLE_APP+=(--tls-key ${DEX_KEY})
fi

EXAMPLE_APP+=( --client-id ${DEX_APP_CLIENT_ID:-example-app} )
EXAMPLE_APP+=( --client-secret ${DEX_APP_CLIENT_SECRET:-ZXhhbXBsZS1hcHAtc2VjcmV0} )

if [[ ! -z "${DEX_APP_DEBUG}" ]]; then
    EXAMPLE_APP+=( --debug )
    echo ${EXAMPLE_APP[@]}
fi

exec ${EXAMPLE_APP[@]}
