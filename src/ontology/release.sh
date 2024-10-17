

VERSION=2.1.0
ONTBASE=https://nfdi.fiz-karlsruhe.de/ontology 
ANNOTATE_ONTOLOGY_VERSION="annotate -V $ONTBASE/$VERSION/\$@ --annotation owl:versionInfo $VERSION"


sh run.sh make clean

sh run.sh make VERSION=$VERSION ONTBASE=$ONTBASE ANNOTATE_ONTOLOGY_VERSION="$ANNOTATE_ONTOLOGY_VERSION" prepare_release
#sh run.sh make VERSION=$VERSION ONTBASE=$ONTBASE prepare_release

sh run.sh make VERSION=$VERSION update-ontolgy-iris
