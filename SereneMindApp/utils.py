import cv2
import numpy as np
import pickle
from deepface import DeepFace
from sklearn.metrics.pairwise import cosine_similarity
import pyttsx3  # ← Added for voice output


def detection(user):
    # Initialize text-to-speech engine (do this once)
    engine = pyttsx3.init()
    with open('./known_faces.pkl', 'rb') as f:
        known_embeddings = pickle.load(f)

    model_name = "VGG-Face"  # Must match training
    threshold = 0.55  # Adjust as needed

    # Keep track of last spoken name to avoid repeating every frame
    last_spoken = None
    last_was_unknown = False

    def recognize_face(frame):
        try:
            detected_faces = DeepFace.extract_faces(
                img_path=frame,
                detector_backend='opencv',
                enforce_detection=False,
                align=True
            )
        except Exception as e:
            print(f"Detection failed: {e}")
            return "No face", 0.0

        if len(detected_faces) == 0:
            return "No face", 0.0

        face_img = detected_faces[0]['face']

        try:
            emb = DeepFace.represent(
                img_path=face_img,
                model_name=model_name,
                enforce_detection=False,
                detector_backend='skip'
            )[0]["embedding"]
        except Exception as e:
            print(f"Embedding failed: {e}")
            return "No face", 0.0

        similarities = {}
        for name, known_emb in known_embeddings.items():
            sim = cosine_similarity([emb], [known_emb])[0][0]
            similarities[name] = sim

        if not similarities:
            return "Unknown", 0.0

        best_name = max(similarities, key=similarities.get)
        best_sim = similarities[best_name]

        if best_sim >= threshold:
            return best_name, best_sim
        else:
            return "Unknown", best_sim
    cap = cv2.VideoCapture(0)

    while True:
        ret, frame = cap.read()
        if not ret:
            break

        name, conf = recognize_face(frame)
        current_identity = name

        if current_identity == "No face":
            pass
        elif current_identity != last_spoken:
            if current_identity == "Unknown":
                if not last_was_unknown:  # avoid repeating "unknown person" every frame
                    engine.say("This is an unknown person")
                    engine.runAndWait()
                    last_was_unknown = True
            else:
                engine.say(f"The person detected is {current_identity}")
                engine.runAndWait()
                last_was_unknown = False

            last_spoken = current_identity

        # Visual feedback on screen
        label = f"{name} ({conf:.2f})"
        color = (0, 255, 0) if name != "Unknown" and name != "No face" else (0, 0, 255)
        cv2.putText(frame, label, (10, 30), cv2.FONT_HERSHEY_SIMPLEX, 1, color, 2)
        cv2.imshow('Face Recognition - Press Q to quit', frame)

        if cv2.waitKey(1) & 0xFF == ord('q'):
            break

    cap.release()
    cv2.destroyAllWindows()