FROM python:3.9
# Set the working directory in the container
WORKDIR /app
ENV PYTHONUNBUFFERED 1# Copy the requirements file into the container
COPY requirements.txt .
RUN pip install --upgrade pip
# Install Python dependencies
RUN pip install -r requirements.txt# Copy only the necessary files
COPY . .
EXPOSE 8008