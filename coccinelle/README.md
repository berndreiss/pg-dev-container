# Coccinelle Scripting Environment for Deriving a Function Catalog

This directory contains the setup for deriving a function catalog of freeing / reallocating functions from a codebase. The codebase can be defined in the file TARGET.

The Makefile runs the runCocci.sh script in scripts for different Coccinelle templates, which are recursively applied to the target using the cocciCreator.sh script.

Results are collected via the collectResults.sh script and stored in results.

