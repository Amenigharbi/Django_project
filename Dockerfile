FROM python:3.9

# Set the working directory in the container
WORKDIR /app

# Copy the application code
COPY . .

# Expose the port the app runs on
EXPOSE 8008

# Define the command to run the application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8008"]
