#!/bin/bash
set -e
declare -A dirs
TARGETPATH="$ANDROID_BUILD_TOP/packages/resources/MateriumTranslations"
###    Definitions     ###
dirs["Backgrounds"]="packages/apps/Backgrounds/res"
dirs["Settings"]="packages/apps/Settings/res"
### End of Definitions ###
for i in "${!dirs[@]}"; do
cp "$ANDROID_BUILD_TOP/${dirs[$i]}"/values/materium_strings.xml "$TARGETPATH/$i.xml"
done
git add --all
git commit -m "[Automated] Pull translations"
