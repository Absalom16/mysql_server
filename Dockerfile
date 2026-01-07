FROM mysql:8.0-debian

# Install Python
RUN apt-get update && apt-get install -y python3 && rm -rf /var/lib/apt/lists/*

COPY health.py /health.py
COPY start.sh /start.sh

EXPOSE 80
EXPOSE 3306

CMD ["/start.sh"]
