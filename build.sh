#!/bin/bash
mkdir -p css
mkdir -p templates
lessc -x less/bootstrap.less css/tiki.css
# https://github.com/oyejorge/less.php/issues/126 - cannot use -x on clearos

