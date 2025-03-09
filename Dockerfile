# Use official Python image
FROM python:3.10-slim

# Set working directory inside the container
WORKDIR /app

# Install system dependencies required for TensorFlow and VGG16
RUN apt-get update && apt-get install -y \
    gcc g++ make libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy application files into the container
COPY . /app

# Create a virtual environment
RUN python -m venv /app/venv

# Activate the virtual environment and install dependencies
ENV PATH="/app/venv/bin:$PATH"
RUN pip install --upgrade pip && pip install -r requirements.txt

# Expose the port Flask will run on
EXPOSE 8765

# Run the Flask app
CMD ["python", "app.py"]
