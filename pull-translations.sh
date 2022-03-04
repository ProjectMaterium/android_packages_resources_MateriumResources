#!/bin/bash
set -e
cd "$ANDROID_BUILD_TOP"
declare -A dirs
TARGETPATH="$ANDROID_BUILD_TOP/packages/resources/MateriumTranslations"
###    Definitions     ###
dirs["Backgrounds"]="packages/apps/Backgrounds/res"
### End of Definitions ###
for i in "${!dirs[@]}"; do
cd "${dirs[$i]}"
cp values/materium_strings.xml "$TARGETPATH/$i.xml"
cd "$ANDROID_BUILD_TOP"
done
cd "$TARGETPATH"
git add --all
git commit -m "[Automated] Pull translations"
