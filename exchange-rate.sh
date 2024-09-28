#!/bin/bash

SYMBOL=""
URL="https://api.kucoin.com/api/v1/market/orderbook/level1?symbol=$SYMBOL"
response=$(curl -s "$URL")
price=$(echo "$response" | jq -r '.data.price')

if [[ -n "$price" ]]; then
	formatted_price=$(printf "%.3f" "$price")
    echo "$formatted_price"
else
    echo "404"
fi