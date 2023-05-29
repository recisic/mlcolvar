#!/bin/bash

# This is a environment setup file for the use of mlcolvar (mainly tutorial notebooks but not only) in Colab

if test -f "is_colab_set_up.txt"; then
    echo This Colab environment is already set up!
else
    notebook_type=$1

    git clone --quiet https://github.com/luigibonati/mlcolvar.git mlcolvar
    echo - Cloned mlcolvar from git

    if [ "$notebook_type" == "TUTORIAL" ]; then
        cp -r mlcolvar/docs/notebooks/tutorials/data data
        echo - Copied tutorials data
    elif [ "$notebook_type" == "EXPERIMENT" ]; then
        cp -r mlcolvar/docs/notebooks/paper_experiments/input_data input_data
        cp -r mlcolvar/docs/notebooks/paper_experiments/results results
        cp -r mlcolvar/docs/notebooks/paper_experiments/utils utils
        echo - Copied papers_experiments data
    else
        cp -r mlcolvar/docs/notebooks/tutorials/data data
        cp -r mlcolvar/docs/notebooks/paper_experiments/input_data input_data
        cp -r mlcolvar/docs/notebooks/paper_experiments/results results
        cp -r mlcolvar/docs/notebooks/paper_experiments/utils utils
        echo - Copied tutorials + papers_experiments data
    fi

    cd mlcolvar 
    pip install -r requirements.txt -q .
    echo - Installed mlcolvar requirements
    echo - Installed mlcolvar

    cd ../
    rm -r mlcolvar
    echo - Removed mlcolvar folder

    echo This Colab environment is setup, enjoy! > is_colab_set_up.txt
    echo Done!
fi