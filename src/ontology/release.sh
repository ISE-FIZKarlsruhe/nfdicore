

VERSION=3.0.1
PRIOR_VERSION=3.0.0
ONTBASE=https://nfdi.fiz-karlsruhe.de/ontology 
ANNOTATE_ONTOLOGY_VERSION="annotate -V $ONTBASE/$VERSION/\$@ --annotation owl:versionInfo $VERSION"


sh run.sh make clean

sh run.sh make VERSION=$VERSION ONTBASE=$ONTBASE ANNOTATE_ONTOLOGY_VERSION="$ANNOTATE_ONTOLOGY_VERSION" prepare_release
#sh run.sh make VERSION=$VERSION ONTBASE=$ONTBASE prepare_release

sh run.sh make VERSION=$VERSION PRIOR_VERSION=$PRIOR_VERSION update-ontology-annotations


# finally refresh imports again, so that version IRIs are updated back to "normal". 
sh run.sh make IMP=false MIR=false refresh-imports
