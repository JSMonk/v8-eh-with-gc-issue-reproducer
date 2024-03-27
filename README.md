# WebAssembly GC and New Exception Handling Issue

This repository contains a simple reproducer for the issue of using GC struct types in combination with the new Exception Handling proposal.

## Description of the Issue

In case of usage of a `ref` as the result of a `try_table` block, I constantly receive the following exception:
```
wasm-function[1]:0x4b: RuntimeError: unreachable
```

I reproduced the issue with V8 versions from `12.4.94` to `12.5.104`.
I didn't check it for the earlier versions.

## How to run the reproducer

This requires the V8 shell (`d8`) and [wasm-tools](https://github.com/bytecodealliance/wasm-tools) to be installed on your machine.

Tu run the reproducer, use `make`:

```bash
make D8_PATH=/path/to/your/d8
```

Change the `reproducer.wat` file to play around the reproducer.
