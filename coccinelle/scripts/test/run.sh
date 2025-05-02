#!/bin/bash

spatch --sp-file test$1.cocci test.c
