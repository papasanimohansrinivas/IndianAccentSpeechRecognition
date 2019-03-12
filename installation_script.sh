#!/bin/bash


#### This scrpt is an attempt to simplify process of installation for deepspeech.pytorch 
### Since we are going to rerun experiments in deepspeech environment this script is useful for repeated instalation process



### Download and install warpctc binding for pytorch

git clone https://github.com/SeanNaren/warp-ctc.git

cd warp-ctc; mkdir build; cd build; cmake ..; make

export CUDA_HOME="/usr/local/cuda"

#echo "$pwd"
cd ..
cd ..
cd ./warp-ctc/

cd ./pytorch_binding 

sudo python setup.py install

sudo apt-get install sox libsox-dev libsox-fmt-all

cd ..
cd ..

### Download and install torchaudio

git clone https://github.com/pytorch/audio.git

### Cd into  cloned directory 


cd ./audio 

### Below command is a fix for installation problem in  bug in colab environment of python 3.6 or 3.7 

### Still not clear for that reason for bug 

### Cannot guarentee if it works for kaggle environment

python setup.py build develop


### Get out of audio Repo !!
cd ..


### cLONE AND INSTALL apex from NVIDIA 

git clone --recursive https://github.com/NVIDIA/apex.git

cd apex 

sudo pip install .

cd ..

### Install ctcdecode 

git clone --recursive https://github.com/parlance/ctcdecode.git

cd ctcdecode 

sudo pip install wget 

sudo python setup.py install 

cd ..


### Clone finally deepspeech.pytorch environment and install after all dependencies are installed


git clone https://github.com/SeanNaren/deepspeech.pytorch.git

cd deepspeech.pytorch/

sudo pip install -r requirements.txt

cd .. 

sudo pip install kaggle

touch /root/.kaggle/kaggle.json

sudo echo '{"username":"mohan007","key":"c4be08252ec4900b31f9173b731a45e5"}' > /root/.kaggle/kaggle.json

sudo kaggle datasets download -d mohan007/train-test-split-indian-accent-common-voice


sudo apt-get install unzip

unzip train-test-split-indian-accent-common-voice.zip

mkdir pytorch_speech_model
mkdir processed_train_txt_files
mkdir processed_dev_txt_files
