#/usr/bin/bash
#Destroys tpch test tables
#Needs information about postgresql 
BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $BASEDIR/../../conf.sh

$PSQL $DATABASE $USER << EOF
 DROP TABLE TPCH_DATA;
EOF