FROM python:3.9-slim
WORKDIR /app

#Define environment variables
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

#nstalls the required Python dependencies inside the container once the requirements.txt file is copied into the container.
COPY requirements.txt requirements.txt

# Install any required dependencies
RUN pip install --no-cache-dir -r requirements.txt


#default port for Flask
EXPOSE 5000

# Copies all local project files into the container.
COPY . .
#CMD ["python", "app.py"] used to run the Flask application when  gunicorn is not installed 
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:5000", "app:app"] 