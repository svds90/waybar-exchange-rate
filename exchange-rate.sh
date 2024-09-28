#!/bin/bash

SYMBOL=""
URL="https://api.binance.com/api/v3/ticker/price?symbol=$SYMBOL"
response=$(curl -s "$URL")
price=$(echo "$response" | jq -r '.price')

if [[ -n "$price" ]]; then
	formatted_price=$(printf "%.3f" "$price")
    echo " $formatted_price"
else
    echo "404"
fi