# import cv2
# import face_recognition
# import numpy as np
# import pickle
# import pyttsx3
# from .models import Kin

# def detection():
# # Initialize the TTS engine
#     engine = pyttsx3.init()

#     # Load the trained face recognition model (SVM or any other classifier)
#     with open('static/face/face_recognition_model.pkl', 'rb') as f:
#         model = pickle.load(f)

#     # Initialize the webcam
#     cap = cv2.VideoCapture(0)

#     # Load the pre-trained face detector from OpenCV
#     face_cascade = cv2.CascadeClassifier('static/face/haarcascade_frontalface_default.xml')

#     print("Press 'q' to quit.")

#     while True:
#         # Capture frame-by-frame
#         ret, frame = cap.read()

#         # Convert the frame to grayscale (required for face detection)
#         gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

#         # Detect faces in the image
#         faces = face_cascade.detectMultiScale(gray, scaleFactor=1.1, minNeighbors=5, minSize=(30, 30))

#         # Draw rectangle around the faces and predict face identity
#         for (x, y, w, h) in faces:
#             # Draw rectangle around face
#             cv2.rectangle(frame, (x, y), (x + w, y + h), (255, 0, 0), 2)

#             # Extract face region from the frame
#             face_image = frame[y:y + h, x:x + w]
            
#             # Convert the face region to RGB (required by face_recognition)
#             face_rgb = cv2.cvtColor(face_image, cv2.COLOR_BGR2RGB)
            
#             # Get face encoding using face_recognition
#             face_encoding = face_recognition.face_encodings(face_rgb)

#             if len(face_encoding) > 0:
#                 face_encoding = face_encoding[0]
                
#                 # Predict the identity using the trained model (SVM)
#                 predicted_label = model.predict([face_encoding])
                
#                 # For confidence value, use predict_proba (if the model supports it)
#                 confidence_values = model.predict_proba([face_encoding])
#                 confidence = max(confidence_values[0])  # Get the highest confidence value

#                 # If confidence is greater than 95%, display the label, else display 'Unknown Person'
#                 label = None
#                 if confidence > 0.95:
#                     label = predicted_label[0]
#                     result_text = f"The person in front of you is {label}."
#                     kin = Kin.objects.filter(name=label).first()
#                     if kin: result_text += kin.description
#                     cv2.putText(frame, f"Predicted: {label} ({confidence*100:.2f}%)", (x, y-10), cv2.FONT_HERSHEY_SIMPLEX, 0.9, (0, 255, 0), 2)
#                 else:
#                     result_text = "This is an unknown person."
#                     cv2.putText(frame, "Predicted: Unknown Person", (x, y-10), cv2.FONT_HERSHEY_SIMPLEX, 0.9, (0, 0, 255), 2)

#                 # Speak the result text
#                 engine.say(result_text)
#                 engine.runAndWait()

#         # Display the resulting frame with face predictions and confidence values
#         cv2.imshow('Face Prediction', frame)

#         # Wait for user to press 'q' to quit
#         key = cv2.waitKey(1) & 0xFF
#         if key == ord('q'):
#             break

#     # Release the webcam and close all windows
#     cap.release()
#     cv2.destroyAllWindows()

