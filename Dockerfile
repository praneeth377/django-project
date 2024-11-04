# Use Python 3.11 as the base image to ensure cgi and distutils modules are available
FROM python:3.11

# Set the working directory
WORKDIR /data

# Install OS-level dependencies for Python
RUN apt-get update && apt-get install -y python3-setuptools

# Install Python dependencies
RUN pip install setuptools && pip install django==3.2

# Copy project files into the container
COPY . .

# Run migrations
RUN python manage.py migrate

# Expose the port for the Django app
EXPOSE 8000

# Command to run the application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]


