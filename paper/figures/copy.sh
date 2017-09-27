#!/bin/bash
set -x
DIR="$HOME/Documents/parsplice-popper/paper/figures"
cp $DIR/motivation-regimes.png keyspace-analysis_throughput.png
cp $DIR/methodology-tradeoff.png keyspace-analysis_cachesize.png
cp $DIR/methodology-tradeoff-dynamic.png keyspace-analysis_cachesize-dynamic.png
cp $DIR/methodology-trajectory.png keyspace-analysis_cachesize-caveats.png
cp $DIR/methodology-keyspace.png keyspace-analysis_size.png

