FROM python:3.9

# Set the working directory in the container
WORKDIR /app

# Install Python dependencies
COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copy only the necessary files
COPY . .

# Expose the port the app runs on
EXPOSE 8008
