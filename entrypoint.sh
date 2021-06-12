#!/bin/bash

# e: Fails immediately on an error
# u: Missing values are treated as errors
set -eu

_main() {
	_switch_to_repository

	_switch_to_branch

	_add_files

	_local_commit

	_push_to_github
}

_switch_to_repository() {
	# shellcheck disable=SC2086
	cd .
}

_switch_to_branch() {
	echo "Checking out new branch";
	echo "INPUT_BRANCH value: $INPUT_BRANCH";
	# shellcheck disable=SC2086
	git checkout -b $INPUT_BRANCH
}

_add_files() {
	echo "Adding files";

	# # shellcheck disable=SC2086
	git add .
}

_local_commit() {
	# shellcheck disable=SC2086
	git commit -m "Commit made by prettier";
}


_push_to_github() {
	echo "push to github";
	
	"git push -u origin $INPUT_BRANCH"
}

_print_dir() {
	echo "print working directory"
	pwd
	echo "list files"
	ls
	echo "changing dir"
	cd .
	pwd
}

_print_dir
