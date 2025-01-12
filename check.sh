#!/bin/bash

# Format the files
echo "Formatting..."
rain fmt ./templates/pipeline.yml -w
rain fmt ./templates/template.yml -w

# Check all template files
echo "Running cfn-lint..."
cfn-lint ./templates/**/*.yml

echo "Running cfn-nag..."
cfn_nag_scan --input-path ./templates
