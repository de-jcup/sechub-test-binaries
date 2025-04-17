#!/bin/bash 

DEPLOY_DIR=$(pwd)
echo "Deploy test client"
echo "------------------"

cd ..
cd sechub-open-source

CURRENT_DIR=$(pwd)

echo "Current directory = $CURRENT_DIR"

function copyPlatform(){
	sourceDir="$CURRENT_DIR/sechub-cli/build/go/platform/$1"
	targetDir="$DEPLOY_DIR/sechub-cli/build/go/platform"
	
	echo "Start copy:"
	echo "- source: $sourceDir"
	echo "- target: $targetDir"
	
	mkdir "$targetDir"
	
	cp "$sourceDir" "$targetDir" -rf
	
}

copyPlatform "linux-amd64"

git commit -m "new test client-version"
git push

