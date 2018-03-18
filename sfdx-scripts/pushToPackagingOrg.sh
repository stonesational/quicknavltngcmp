#!/bin/sh

#Variables
PKG_ORG_ALIAS="QuickNavPkgOrg"
PKG_NAME="Quick Nav"
REPO_ROOT_DIR=$(dirname "$PWD")

if [ -d "$REPO_ROOT_DIR/mdapi_output_dir" ]; then
  rm -r "$REPO_ROOT_DIR/mdapi_output_dir"
fi

cd "$REPO_ROOT_DIR"

sfdx force:source:convert --outputdir "$REPO_ROOT_DIR/mdapi_output_dir" --packagename "$PKG_NAME"

sfdx force:mdapi:deploy --deploydir "$REPO_ROOT_DIR/mdapi_output_dir" --targetusername "$PKG_ORG_ALIAS" -w 10