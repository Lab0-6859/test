# Dockerfile pour une application Hello World en Python sur Debian
FROM debian:latest

# Mise à jour des paquets et installation de Python3 et pip
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Copie des fichiers de l'application
WORKDIR /app
COPY . .

# Installation des dépendances Python
RUN pip3 install -r requirements.txt

# Exposition du port 5000
EXPOSE 5000

# Commande pour démarrer l'application
CMD ["python3", "app.py"]