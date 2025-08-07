
FROM python:3.10-slim



# Set working directory in container
WORKDIR /app

# Copy all files to the container's working directory
COPY . .

RUN pip install -r requirements.txt

# Expose port (Flask default is 5000)
EXPOSE 5000

# Run the Flask app
CMD ["python", "calc.py"]