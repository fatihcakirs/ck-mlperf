#!/bin/bash

if [ "${CK_MODEL_DATA_LAYOUT}" == "NCHW" ]; then
    POSSIBLE_LAYOUT_CONVERSION="--inputs-as-nchw ${MODEL_INPUT_LAYER_NAME}"
else
    POSSIBLE_LAYOUT_CONVERSION=""
fi

$CK_ENV_COMPILER_PYTHON_FILE -m tf2onnx.convert --input $CK_ENV_TENSORFLOW_MODEL_TF_FROZEN_FILEPATH --inputs $MODEL_INPUT_LAYER_NAME $POSSIBLE_LAYOUT_CONVERSION --outputs $MODEL_OUTPUT_LAYER_NAME --fold_const --verbose --opset 8 --output ${INSTALL_DIR}/${PACKAGE_NAME} # --unknown-dim 1
