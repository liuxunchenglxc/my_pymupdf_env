FROM python:3.13

RUN DEBIAN_FRONTEND=noninteractive apt update && apt install -y \
    git \
    tesseract-ocr \
    tesseract-ocr-chi-sim \
    tesseract-ocr-chi-sim-vert \
    tesseract-ocr-chi-tra \
    tesseract-ocr-chi-tra-vert \
    tesseract-ocr-eng \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir pymupdf4llm pytest fontTools

# 跑一下测试
RUN git clone https://github.com/pymupdf/PyMuPDF.git && (pytest --tb=no --no-header --no-summary -q PyMuPDF/tests || true) ; rm -rf PyMuPDF

WORKDIR /workspace