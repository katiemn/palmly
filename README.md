# Palmly User Manual 

![](Documents/palmly-poster.png)

## Neural Networks

All files needed to test the three retrained models can be found in the Classifiers directory of this repo. This tutorial has been adopted from: https://codelabs.developers.google.com/codelabs/tensorflow-for-poets/#0 

**Steps:**  
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
5. A test image has been provided in the directory to classify. You can classify this image, or any other by simply changing the image flag, with the following: 

To classify the heart line:
```
python -m label_image --graph=retrained_graph.pb --image=test_image.jpg
```
To classify the head/life lines:
```
python label_image.py --graph=retrained_graph.pb --labels=tf_files/retrained_labels.txt --input_layer=Placeholder --output_layer=final_result --image=test_image.jpg
```

6. Repeat with different images of your choosing. To do this, simply take an image of a left palm and place it in the same location as the test image. Then, change the image flag in the classification command to the name of the image. Or, go back to Step 4 and choose a new hand line to classify on the test image. This can be done by changing directories into the head_line_classifier or the life_line_classifier.

The combination of the three line characterizations corresponds to a palm reading, which are outlined below. 

### Head Line:
- **Short:** You are a quick thinker who reaches conclusions without any trouble, making you a very decisive individual.   
- **Long/Straight:** You often find yourself pondering things in great detail, over and over become coming eventually coming to a decision. 
- **Splits:** You are very sensitive to others, meaning that you can very easily see someone else's perspective from their shoes. This means that you may change your opinion every now and then. 
- **Long/Curved:** You are a creative thinker who can image various possible outcomes or approaches to any given situation. 

### Heart Line:
- **Long/Straight:** You are a rational and analytic thinker who always considers the feelings of others. Those around you very much value you for this trait. 
- **Short/Straight:** You are an individual that needs your freedom. In this regard, you show your love and affection through actions rather than words. 
- **Long/Curved:** Your passions and desires drive you, and you are very upfront about that, making it known to anyone who will listen. 
- **Short/Curved:** You are a reserved person and prefer small groups to big gatherings. You tend to open up more in one-on-one scenarios. 

### Life Line:
- **Long:** You are a rock who people often count on to remain strong in difficult times. 
- **Short:** When life becomes overly stressful, remaining busy helps you feel safe and secure. 
- **Faint:** You may find it helpful to chill out now and then. For example, yoga, meditation, walking, or taking time for yourself could do you some good. 
- **Broken:** Each break in the line represents a traumatic experience that has had a significant impact on your life choices. 

The above information can be referenced more in depth at: https://www.realsimple.com/work-life/life-strategies/palm-reading-guide





