# Palmly User Manual 

![](Documents/palmly-poster.png)

## Neural Networks

All files needed to test the three retrained models can be found in the Classifiers directory of this repo. This tutorial has been adopted from: https://codelabs.developers.google.com/codelabs/tensorflow-for-poets/#0 

Steps:  
1. Install TensorFlow via a Python development environment 
    * Ensure that python3, pip3, and virtualenv are all installed 
    * Create a new virtual environment:  

    On Ubuntu / mac OS:
    ```
    virtualenv --system-site-packages -p python3 ./venv
    ```
    On Windows:
    ```
    virtualenv --system-site-packages -p python3 ./venv
    ```
    * Activate the environment

    On Ubuntu / mac OS:
    ```
    source ./venv/bin/activate  # sh, bash, ksh, or zsh
    ```
    On Windows:
    ```
    .\venv\Scripts\activate
    ```
    * Install packages
    ```
    pip install --upgrade pip
    pip list  
    ```
    * Install the TensorFlow pip package 
    ```
    pip install --upgrade tensorflow==1.15
    ```
2. Clone the repo and cd into palmly
```
git clone https://github.com/katiemn/palmly.git
cd palmly
```
3. Change directories into the Classifier folder 
```
cd Classifiers
```
4. Choose the hand line that you would like to classify (ex: heart line)
```
cd heart_line_classifier
```
5. A test image has been provided in the directory to classify. You can classify this image, or any other, with the following: 

To classify the heart line:
```
python -m label_image --graph=retrained_graph.pb --image=test_image.jpg
```
To classify the head/life lines:
```
python label_image.py --graph=retrained_graph.pb --labels=tf_files/retrained_labels.txt --input_layer=Placeholder --output_layer=final_result --image=test_image.jpg
```

6. Repeat with different images of your choosing. Or, go back to Step 4 and choose a new hand line to classify. 





