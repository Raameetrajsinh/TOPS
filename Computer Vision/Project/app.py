import streamlit as st
import cv2
import numpy as np
from ultralytics import YOLO
from PIL import Image
import os
import pytesseract
pytesseract.pytesseract.tesseract_cmd = r"C:\Program Files\Tesseract-OCR\tesseract.exe"

st.title("YOLO Image Processing")


uploaded_file = st.file_uploader("Upload an image", type=["jpg", "jpeg", "png", "bmp"])


try:
    model = YOLO('best_license_palte_model_2.pt')  
except Exception as e:
    st.error(f"Error loading YOLO model: {e}")


def predict_and_save_image(input_path, output_path):
    try:
        results = model.predict(input_path, device='cpu')
        image = cv2.imread(input_path)
        image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
        number_plate = None

        for result in results:
            for box in result.boxes:
                x1, y1, x2, y2 = map(int, box.xyxy[0])
                confidence = box.conf[0]
                cv2.rectangle(image, (x1, y1), (x2, y2), (0, 255, 0), 2)
                cv2.putText(image, f'{confidence*100:.2f}%', (x1, y1 - 10),
                            cv2.FONT_HERSHEY_SIMPLEX, 0.9, (255, 0, 0), 2)

            # Crop and OCR
            roi = image[y1:y2, x1:x2]
            number_plate = pytesseract.image_to_string(roi,config='--psm 6')



        image = cv2.cvtColor(image, cv2.COLOR_RGB2BGR)
        cv2.imwrite(output_path, image)
        return output_path,number_plate
    except Exception as e:
        st.error(f"Error processing image: {e}")
        return None, None


if uploaded_file is not None:
    os.makedirs("temp", exist_ok=True)
    input_path = os.path.join("temp", uploaded_file.name)
    output_path = os.path.join("temp", f"output_{uploaded_file.name}")

    try:
        with open(input_path, "wb") as f:
            f.write(uploaded_file.getbuffer())

        with st.spinner("Processing..."):
            result_path,number_plate = predict_and_save_image(input_path, output_path)
            

        if result_path:
            st.image(result_path)
            st.markdown(f"**Number Plate:** {number_plate if number_plate else 'Not detected'}")

    except Exception as e:
        st.error(f"Error uploading or processing file: {e}")
