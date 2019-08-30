#!/bin/bash
du -ah $1 | sort -n -r | head -n 20
