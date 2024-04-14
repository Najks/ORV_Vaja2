# osnovna slika Pythona
FROM python:3.8-slim

# delovni direktorij v kontejnerju
WORKDIR /app

# kopiram vsebino trenutnega direktorija v /app v kontejnerju
COPY . /app

# Namestim potrebne knjižnice
RUN apt-get update && apt-get install -y --no-install-recommends \
    && pip install --no-cache-dir --upgrade pip \
    && pip install pytest numpy opencv-python-headless

# Čiščenje apt cache za zmanjšanje velikosti slike
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Nastavite ukaz, ki se izvede ob zagonu kontejnerja
CMD ["python", "./naloga2.py"]

