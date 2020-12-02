#!/bin/bash

set -e
set -x

rm -Rf draft-3 v1.0 v1.1.0-dev1 v1.1.0 v1.1 v1.2 temp

git clone https://github.com/common-workflow-language/common-workflow-language.git \
	temp
mv temp/v1.0 ./
mv temp/draft-3 ./
git clone https://github.com/common-workflow-language/cwl-v1.1.git \
	v1.1
git clone https://github.com/common-workflow-language/cwl-v1.2.git \
	v1.2

cwltool $@ --cache cache --relax-path-checks --outdir common-workflow-language.github.io site/cwlsite.cwl site/cwlsite-job.yaml
