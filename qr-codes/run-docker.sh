docker run -it -p 7860:7860 --platform=linux/amd64 --gpus all \
    -e HF_TOKEN=$HF_TOKEN \
    registry.hf.space/huggingface-projects-qr-code-ai-art-generator:latest python app.py
