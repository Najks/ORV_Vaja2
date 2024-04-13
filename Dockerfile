# osnovna slika Pythona
FROM python:3.8-slim

# delovni direktorij v kontejnerju
WORKDIR /app

# kopiram vsebino trenutnega direktorija v /app v kontejnerju
COPY . /app

# Namestim potrebne knjižnice
RUN apt-get update && \
    apt-get install -y python3-pip && \
    pip install --no-cache-dir --upgrade pip && \
    pip install pytest numpy opencv-python-headless && \
    rm -rf /var/lib/apt/lists/*  # Čiščenje APT predpomnilnika

# Nastavite ukaz, ki se izvede ob zagonu kontejnerja
CMD ["python", "./naloga2.py"]
