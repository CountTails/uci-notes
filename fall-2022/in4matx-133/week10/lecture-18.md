# Lecture 18: Alternative interaction

## Machine learning

- The application of an **algorithm** on a **set of data** to make **predictions for computational actions**
    - Algorithms: Supervised, unsupervised, and reinforcement learning algorithms
    - Set of data: Sample data, or training data, i s assembled into a model, which is the input to an algorithm
    - Predictions for computational actions: Based on input model, algorithm predicts what the next actions should be

### Supervised algorithms

- Learn from models with desired input and output

### Unsupervised algorithms

- Algorithms that learn from models with desire input **only**
- Output is predicted

### Reinforcement algorithms

- Algorithms that learn do not assume knowledge from a model
- Predict output based on dynamic input

### Models

- Models are built from existing data
    - Dataset for models must be large (larger is better)
    - Data must be annotated (giraffe labeled as giraffe)
- Many datasets are kept private (costly to produce), but there are plenty also available for free
    - UCI provides many [datasets](https://archive.ics.uci.edu/ml/datasets.php)
    - Also, [Kaggle](https://www.kaggle.com/)
    - Likely others

### Tools

- Many exist, but TensorFlow has become the primary entry point
- A platform for building and deploying machine learning
    - Can build new models
    - Apply existing models
    - Apply existing algorithms
    - Support for numerous languages, but Python is most used
- TensorFlow.js adds ML capability to the browser

## `HandTrack.js`

- Built on TensorFlow.js
- Our version uses a model derived from the EgoHands dataset
    - Contains 15,000 examples of hands
    - Assembled from videos captured with Google Glass
- Model is built with TensorFlow Object Detection API
- Trained model is then converted to a TensorFlow.js webmodel using TensorFlow.js tooling
- The handtrack.js code then loads the webmodel to make predictions based on inputs collected (static image or video)

### Basic functionality of the library

- Provides core functions and helper functions to process images
- `load(params)`: accepts a params object and performs the initialization of the library. Returns a model object, required to make a prediction
- Model object provides a `detect` function that will take an image as input and predict hand pose against the pre-built model

### `params`

- `imageScaleFactor`: Set to reduce the size of your image, thus improving prediction time (possible reducing accuracy). Default is 1:1
- `maxNumBoxes`: THe number of boxes to detect. If you only need one 1 hand, the set it to 2 (1 for face)
- `iouThreshold`: "intersection of union", how sensitive do you want your overlapping object to be?
- `scoreThreshold`: The higher the score, the lower the amount of detections you will get. Find a balance!

### Prediction results

- Bounding box (`bbox`): The position and size of the detected object
- `Class`: The predicted object (hand, face)
- `Label`: The predicted gesture (open, closed, point, pinch)
- `Score`: The confidence of the prediction. Hight score equals greater likelihood of accurate prediction

## Machin learning in UI

- How does all this apply to our work with user interfaces?
- The ability to predict opens new directions for UI's
    - Gestures (hand and full body)
    - On-body interaction
    - Eye-gaze
    - Speech

### On-body interaction

- Armband detects muscle deflection
- Deflections can be modeled to predict on body location
- Projected overlay coordinates with predictions to identify input and perform output

### Eye-gaze

- Standard web camera, tracks eye movement
- Eye movement combined with cursor position, predicts location of gaze
- Slightly lower resolution, but able to reproduce effects of expensive commercial eye tracking devices

### Speech

- It's complicated
- Reserved for organizations large enought to reate very large datasets
- Automatic speech recognition is hard
- Text-to-speech generatino is hard
- Open source speech engines exist, but they far fall below the quality of services like Alexa and Siri
- Common speech
    - The Mozilla Foundation is working on an open dataset
    - Ask US to help build the dataset by recording preset speech passages
    - But ... datasets are released back to the public!

## Multiple modalities

- What's wrong with just the keyboard and mouse or a touchscreen?
- In many cases, these three input devices are just fine
- **Accessibility** ensures that software is designed with a "common language" that all systems can interpret
- Accessible system do not ensure comfort or efficiency
- Can offset non-critical tasks with alternatives in UI's
- Bridging alternative interactions with touch, keyboard, and mouse can broaden the ways in which we can control user interaces
- Alternative interactions can increase usabilty for people with disability