#!/bin/bash

PYTHON=python

curdir=`dirname $0`
curdir=`realpath $curdir`

# args
prep_script=$curdir/../python/gen_asrinput_continuous.py
libricss_path=$EXPROOT/data
script_path=$curdir/../scripts
asr_path=$AMPATH
$PYTHON $prep_script --multi_stream --input_path $libricss_path/separation_result/continuous_separation --decode_path $libricss_path/separation_baseline --tool_path $script_path --am_path $asr_path

# Customized Procesed data
# prep_script=$curdir/../python/gen_asrinput_continuous.py
# script_path=$curdir/../scripts
# asr_path=$AMPATH
# decode_path=$libricss_path/TPMCN/v2_CM/MIMO/segments_decode_vad0
# data_path=$libricss_path/TPMCN/v2_CM/MIMO/segments


$PYTHON $prep_script --multi_stream --input_path $data_path --decode_path $decode_path --tool_path $script_path --am_path $asr_path

cd $decode_path/decoding_cmd
. decode.sh
$curdir/../../scoring/scripts/eval_continuous.sh $decode_path/decoding_result.sorted/13_0.0/
$PYTHON $curdir/../../scoring/python/report.py --inputdir $decode_path/decoding_result.sorted/13_0.0/
