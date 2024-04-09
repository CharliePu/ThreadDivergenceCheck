#!/bin/bash

for file in "./OpenCLKernels"/*; do
    if [[ $file == *.bc ]]; then
        echo "Running $file"
        ./build/TDC $file
    fi
done

echo "Done"
