# Dockerfile pour une application Hello World en Python sur Debian
FROM debian:latest

# Mise à jour des paquets et installation de Python3, pip et venv
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    && rm -rf /var/lib/apt/lists/*

# Copie des fichiers de l'application
WORKDIR /app
COPY . .

# Création d'un environnement virtuel et installation des dépendances
RUN python3 -m venv /app/venv
RUN /app/venv/bin/pip install -r requirements.txt

# Exposition du port 5000
EXPOSE 5000

# Commande pour démarrer l'application avec l'environnement virtuel
CMD ["/app/venv/bin/python", "app.py"]