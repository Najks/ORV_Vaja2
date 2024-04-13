# osnovna slika pythona
FROM python:3.8-slim

# nastavim direktorij
WORKDIR /app

# kopiram v zabojnik
COPY . /app

# potrebne knjiznice
RUN pip install --no-cache-dir -r requirements.txt

# ukaz se bo izvedo ob koncu zabojnika
CMD ["python", "./naloga2.py"]