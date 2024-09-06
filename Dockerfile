# Dockerfile
# 1. Use Python as the base image
FROM python:3.12-slim

# 2. Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# 3. Set the working directory inside the container
WORKDIR /usr/src/app

# 4. Copy the current directory contents into the container at /usr/src/app
COPY . /usr/src/app/

# 5. Install system dependencies
RUN apt-get update && apt-get install -y libpq-dev gcc

# 6. Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# 7. Open port 8000 for Django
EXPOSE 8000

# 8. Run the Django development server (in production, this will be a different command)
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
