.PHONY: check-tools compile run

all: check-tools compile run

# Check if wasm-tools is installed 
check-tools:
	@if ! command -v wasm-tools &> /dev/null; then \
		echo "wasm-tools could not be found."; \
		echo "Please install wasm-tools with the following command: cargo install wasm-tools"; \
		exit 1; \
	fi

# Compile WAT file to Wasm
compile:
	wasm-tools parse reproducer.wat > reproducer.wasm

# Run with all the required flags
# The issue were reproduced on the latest 12 versions (12.4.94 - 12.5.104)
# I didn't check it with earlier versions
run:
ifeq ($(D8_PATH),)
	$(error D8_PATH is not set. Please set it to the path of your V8 shell executable when calling make, e.g. `make D8_PATH=/path/to/your/d8 run`)
endif
	$(D8_PATH) --module --no-experimental-wasm-legacy-eh --experimental-wasm-exnref reproducer.mjs
