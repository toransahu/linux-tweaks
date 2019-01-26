#! /bin/sh
#
# mvn_create_project.sh
# Copyright (C) 2019 Toran Sahu <toran.sahu@yahoo.com>
#
# Distributed under terms of the MIT license.
#


mvn archetype:generate -DgroupId=com.$1.$2 -DartifactId=$2 -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.4 -DinteractiveMode=false
