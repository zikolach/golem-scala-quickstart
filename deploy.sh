#!/usr/bin/env bash

# just some of the Golem CLI examples

# deploys new golem component
golem-cli component add --component-name shopping-cart target/dist/main.wasm

# update existing component
golem-cli component update --component-name shopping-cart target/dist/main.wasm

# list component versions
golem-cli component list --component-name shopping-cart

# add new worker
golem-cli worker add --worker-name shopping-cart-1 --component-name shopping-cart

# list workers
golem-cli worker list --component-name shopping-cart

# update worker component version
golem-cli worker update --component-name shopping-cart --worker-name shopping-cart-1 --mode auto --target-version 5

# delete worker
golem-cli worker delete --worker-name shopping-cart-1 --component-name shopping-cart

# invoke component method
golem-cli worker invoke-and-await --component-name shopping-cart --worker-name shopping-cart-1 --function 'pack:name/api.{initialize-cart}' --arg '"test-user"'

# invoke another component method
golem-cli worker invoke-and-await \
    --component-name shopping-cart \
    --worker-name shopping-cart-1 \
    --function 'pack:name/api.{add-item}' \
    --arg '{product-id: "1", name: "Carrot", price: 123.45, quantity: 5}'

# yet another method
golem-cli worker invoke-and-await \
    --component-name shopping-cart \
    --worker-name shopping-cart-1 \
    --function 'pack:name/api.{cart-contents}'