#!/bin/sh

executeCommandQuietly() {
  $1 > /dev/null
  exitCode=$?
  if [ $exitCode -ne 0 ];
  then
    echo "ERROR: $2 (Code: $exitCode)"
    exit 1
  fi
}

executeCommandQuietly "curl --version" "curl is not present.  curl is not available within the environment path or is not installed."

if [ -z "$1" ];
then
  # URL command line argument is not provided, but is required, so exit.
  echo "ERROR: URL is required."
  exit 1
fi
URL="$1"

CURL_OPTS=""
if [ -n "$2" ];
then
  # CA certificate command line argument is provided.
  if [ -f "$2" ];
  then
    CA_CERTIFICATE="$2"
    MTLS_ARGS=""

    if [[ -n "$3" && -z "$4" ]];
    then
        echo "ERROR: If certificate is specified, key argument is required"
        exit 1
    fi

    if [[ -n "$3" && -n "$4" ]];
    then
        if [[ -f "$3" && -f "$4" ]];
        then
            CERT="$3"
            KEY="$4"
            MTLS_ARGS=" --cert $CERT --key $KEY "
        else
            echo "ERROR: Client key and/or certificate files does not exist or is not a file"
            exit 1
        fi
    fi

    CURL_OPTS="--insecure --cacert $CA_CERTIFICATE $MTLS_ARGS --fail --silent --show-error -L -X GET --connect-timeout 5 --max-time 10"
  else
    # CA certificate either does not exist or is not a file.
    echo "ERROR: CA certificate does not exist or is not a file."
    exit 1
  fi
else
  # CA certificate command line argument is not provided.  Do not reference in request.
  CURL_OPTS="--insecure --fail --silent --show-error -L -X GET --connect-timeout 5 --max-time 10"
fi

curl $CURL_OPTS $URL
exitCode=$?
if [ $exitCode -eq 0 ];
then
  # Healthcheck request is healthy.
  exit 1
fi

# Healthcheck request is not healthy.
exit 1
