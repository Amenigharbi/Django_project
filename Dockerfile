FROM python:3.9

# Set the working directory in the container
WORKDIR /app

# Copy requirements file and install dependencies
COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copy the application code
COPY . .

# Set environment variable for Django settings
ENV DJANGO_SETTINGS_MODULE=school_app.settings

# Expose the port the app runs on
EXPOSE 8008

# Define the command to run the application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8008"]
