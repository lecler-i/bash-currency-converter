#!/bin/bash

# xe.com accepts only CAPITALIZED currency codes
value=$1
from=$(echo $2 | tr '[:lower:]' '[:upper:]')
to=$(echo $3 | tr '[:lower:]' '[:upper:]')

[ $# -lt 3 ] && {
    echo "Usage: $0 value source_currency target_currency";
    exit 1;
}

# sed with updated regexp (2024-01-29)
result=$(curl -sSL "https://www.xe.com/currencyconverter/convert/?Amount=$value&From=$from&To=$to" | sed -n 's/.*result__BigRate-[^>]*>\([^<]*\)<.*/\1/p');

echo "$value $from = $result $to";
