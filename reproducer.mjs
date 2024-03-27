const wasmBuffer = read("./reproducer.wasm", "binary");
const wasmModule = new WebAssembly.Module(wasmBuffer);
const wasmInstance = new WebAssembly.Instance(wasmModule, { env: { print: console.log } })
const { main } = wasmInstance.exports;
main()
