#!/usr/bin/env bash

value=$1
from=$2
to=$3

[ $# -lt 3 ] && {
    echo "Usage: $0 value source_currency target_currency";
    exit 1;
}

curl -s "https://www.xe.com/currencyconverter/convert/?Amount=$value&From=$from&To=$to" | sed -n -n "s/.*<span class='uccResultAmount'>\([^<]*\)<\/span>.*/\1/p"
