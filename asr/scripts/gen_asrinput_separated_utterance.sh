#!/bin/bash
PYTHON=python

curdir=`dirname $0`
curdir=`realpath $curdir`
# args

# prep_script=$curdir/../python/gen_asrinput_raw_utterance.py
# libricss_path=$EXPROOT/data
# script_path=$curdir/../scripts
# decode_path=$libricss_path/separation_baseline/utterance
# $PYTHON $prep_script --input_path $libricss_path/separation_result/utterance_separation --tool_path $script_path --decode_path $decode_path --experiment_setup separated

prep_script=$curdir/../python/gen_asrinput_raw_utterance.py
script_path=$curdir/../scripts
libricss_path=/home/dev60-data2-mount/albert/LibriCSS_output/copy_input
decode_path=$libricss_path/utterances_decode
data_path=$libricss_path/utterances

cp $EXPROOT/utterance_transcription.txt $data_path

$PYTHON $prep_script --input_path $data_path --tool_path $script_path --decode_path $decode_path --experiment_setup separated

cd $decode_path/decoding_cmd
. decode.sh
cd $EXPROOT/..
