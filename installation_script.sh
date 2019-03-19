sudo apt-get install software-properties-common

sudo curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash

sudo apt-get install git-lfs

git lfs install 

git clone https://github.com/mozilla/DeepSpeech.git

sudo apt-get install python-pip python-dev

cd ./DeepSpeech/

sudo rm requirements.txt

sudo echo -e  "pandas \nprogressbar2 \npython-utils \nnumpy == 1.15.4 \nmatplotlib \nscipy \nsox \nparamiko >= 2.1 \npython_speech_features \npyxdg \nbs4 \nsix \nrequests \ntables \nattrdict \nsetuptools \nlibrosa \nsoundfile" >> requirements.txt

sudo pip3 uninstall tensorflow -y 
sudo pip3 install 'tensorflow-gpu'

sudo pip3 install -r requirements.txt

sudo pip3 install $(python3 ./util/taskcluster.py --decoder)

sudo pip3 install kaggle

./DeepSpeech.py --helpfull

if [[ -d /root/.kaggle ]] ; then echo ;

else 
	sudo mkdir /root/.kaggle;

fi;

touch /root/.kaggle/kaggle.json


sudo echo '{"username":"mohan007","key":"c4be08252ec4900b31f9173b731a45e5"}' >  /root/.kaggle/kaggle.json


cd ..

kaggle datasets download -d mohan007/processedcommonvoice-indianaccents

unzip processedcommonvoice-indianaccents.zip

tar xzf indian_accents.tar.gz

wget https://github.com/mozilla/DeepSpeech/releases/download/v0.4.1/deepspeech-0.4.1-models.tar.gz

tar xvfz deepspeech-0.4.1-models.tar.gz

mkdir ./deepspeech_modelexport
