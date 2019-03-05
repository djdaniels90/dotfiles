#!/usr/bin/env bash

# install_python_env
# install_code_analysis
# install_data_analysis

# function py_install_env {
# 	# brew install python3
# 	# pip3 install virtualenv
# }

function py_code_analysis {
	pip3 install codeintel
	pip3 install beautysh
}

function py_data_analysis {
	pip3 install numpy
	pip3 install pandas
}
