FROM python:3.7.3-stretch

# Working Directory
WORKDIR /app

# Copy source code to working directory
COPY Makefile requirements.txt cgiserver.py /app/
COPY cgi-bin /app/cgi-bin/

# Install packages from requirements.txt
# hadolint ignore=DL3013
RUN pip install --upgrade pip &&\
    pip install --trusted-host pypi.python.org -r requirements.txt

# Expose port 8081
EXPOSE 8081

# Run app.py at container launch
CMD ["python", "cgiserver.py"]
