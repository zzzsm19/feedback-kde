#/bin/bash
BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $BASEDIR/../../conf.sh

cd /tmp
python $BASEDIR/generator2.py
cd -

#First drop the existing tables
$BASEDIR/drop-set2-tables.sh

#PSQL command
$PSQL $DATABASE $USER << EOF
	CREATE TABLE gen2_d5(
		c1 double precision,
		c2 double precision,
		c3 double precision,
		c4 double precision,
		c5 double precision);
	COPY gen2_d5 FROM '/tmp/data_gen2_d5.csv' DELIMITER',';
EOF