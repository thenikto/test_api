#!/bin/bash
uvicorn app_api:app --host 0.0.0.0 --port 8000 &

# Запустить Streamlit на порту 8501
streamlit run streamlit_app.py --server.port=8501 --server.address=0.0.0.0
