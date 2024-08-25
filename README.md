Sample Golem App in Scala
=========================

## Quickstart

1. Install rust https://www.rust-lang.org/tools/install
2. Install golem *universal* cli https://learn.golem.cloud/docs/quickstart
   `cargo install --features universal golem-cloud-cli`
3. Run Golem locally
   `docker-compose -f docker-compose-postgres.yaml up`
4. Make sure you have node/npm installed
5. Compile wasm component
   `sbt wasmComponent`
6. Add register wasm component
   `golem-cli component add --component-name shopping-cart target/dist/main.wasm`
7. Add new worker
   `golem-cli worker add --worker-name shopping-cart-1 --component-name shopping-cart`
8. Invoke component
   ```
   golem-cli worker invoke-and-await \
    --component-name shopping-cart \
    --worker-name shopping-cart-1 \
    --function 'pack:name/api.{initialize-cart}' \
    --arg '"test-user"'
   ```

## Links

- [An Overview of WIT](https://component-model.bytecodealliance.org/design/wit.html#structure-of-a-wit-file)
- [SBT WASM component plugin](https://github.com/golemcloud/sbt-wasm-component)
- [Golem ScalaJS WIT bindgen](https://github.com/golemcloud/golem-scalajs-wit-bindgen)
