#!/usr/bin/env bash

value=$1
from=$2
to=$3

[ $# -lt 3 ] && {
    echo "Usage: $0 value source_currency target_currency";
    exit 1;
}

wget -qO- "http://www.google.com/finance/converter?a=$value&from=$from&to=$to" | sed '/res/!d;s/<[^>]*>//g';
